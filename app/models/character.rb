class Character < ApplicationRecord
  has_one_attached :image

  has_many :past_topics, dependent: :destroy
  has_many :future_topics, dependent: :destroy
  has_many :character_categories
  has_many :categories, through: :character_categories
end
