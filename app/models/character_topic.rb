class CharacterTopic
  include ActiveModel::Model
  attr_accessor :name, :image, :url, :describe, :past_topic, :created_date, :future_topic, :user_id

  with_options presence: true do
    validates :name
    validates :created_date
  end

  def save
    character = Character.create(name: name, url: url, describe: describe, image: image, user_id: user_id)
    PastTopic.create(past_topic: past_topic, created_date: created_date, character_id: character.id)
    FutureTopic.create(future_topic: future_topic, character_id: character.id)
  end
end