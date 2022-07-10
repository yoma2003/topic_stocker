class Character < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :past_topics, dependent: :destroy
  has_many :future_topics, dependent: :destroy
  has_many :character_categories, dependent: :destroy
  has_many :categories, through: :character_categories

  validates :name, presence: true

  scope :order_updated_at, -> (current_user_id) {where(user_id: current_user_id).order(updated_at: :desc)}
  scope :order_past_topic, -> (current_user_id) {
    left_joins(:past_topics).group(:id).order("MAX(past_topics.created_date) DESC").where(user_id: current_user_id)
  }

  scope :category_order_updated_at, -> (category_id) {joins(:character_categories).where(character_categories: { category_id: category_id }).order(updated_at: :desc)}
  scope :category_order_past_topic, -> (category_id) {
    left_joins(:past_topics, :character_categories).group(:id).order("MAX(past_topics.created_date) DESC").where(character_categories: { category_id: category_id })
  }
end