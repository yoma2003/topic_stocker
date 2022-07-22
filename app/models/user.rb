class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image

  has_many :characters, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true

  validate :image_type_validation

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      user.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end

  private

  def image_type_validation
    if self.image.attached? && !self.image.content_type.in?(%('image/jpeg image/png'))
      self.errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
    end
  end
end
