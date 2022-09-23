class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  has_one_attached :image

  has_many :characters, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true

  validate :image_type_validation
  
  def self.from_omniauth(auth, provider)
    user = User.where(uid: auth.uid, provider: provider).first

    unless user
      user = User.create(
        name:     auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        uid:      auth.uid,
        provider: provider
      )
      sns_image = URI.parse("#{auth.info.image}").open
      user.image.attach(io: sns_image, filename: "#{auth.uid}-#{provider}.jpg")
    end

    user
  end

  def self.guest
    find_by!(email: 'guest@example.com')
    # find_or_create_by!(email: 'guest@example.com') do |user|
    #   user.name = "ゲストユーザー"
    #   user.password = SecureRandom.urlsafe_base64
    #   user.image.attach(io: File.open('app/assets/images/guest_image.jpg'), filename: 'test_image.jpg')
    # end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def image_type_validation
    if self.image.attached? && !self.image.content_type.in?(%('image/jpeg image/png'))
      self.errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
    end
  end
end
