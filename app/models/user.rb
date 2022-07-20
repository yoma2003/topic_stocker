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

  private

  def image_type_validation
    if !self.image.content_type.in?(%('image/jpeg image/png'))
      self.errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
    end
  end
end
