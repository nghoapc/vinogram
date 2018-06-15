class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  def get_avatar
    if self.avatar.present?
      self.avatar.url
    else
      'default_images.jpeg'
    end
  end
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

end
