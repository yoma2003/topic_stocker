class CharacterTopic
  include ActiveModel::Model
  attr_accessor :name, :image, :url, :describe, :past_topic, :created_date, :future_topic, :user_id, :category_ids

  with_options presence: true do
    validates :name
    validates :user_id
  end

  validate :image_type_validation

  def save
    character = Character.create(name: name, url: url, describe: describe, image: image, user_id: user_id, category_ids: category_ids)
    PastTopic.create(past_topic: past_topic, created_date: created_date, character_id: character.id)
    FutureTopic.create(future_topic: future_topic, character_id: character.id)
  end

  private

  def image_type_validation
    if !self.image.content_type.in?(%('image/jpeg image/png'))
      self.errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
    end
  end
end