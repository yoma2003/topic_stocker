class Character < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :past_topics, dependent: :destroy
  has_many :future_topics, dependent: :destroy
  has_many :character_categories, dependent: :destroy
  has_many :categories, through: :character_categories

  validates :name, presence: true

  scope :order_updated_at, -> (current_user_id) {where(user_id: current_user_id).order(updated_at: :desc)}
  scope :order_past_topic, -> (current_user_id) {find_by_sql(
    ["SELECT ch.*, MAX(p.created_date) FROM characters ch
    INNER JOIN past_topics p ON p.character_id = ch.id
    WHERE user_id = ?
    GROUP BY p.character_id
    ORDER BY max(p.created_date) DESC", current_user_id]
  )}

  scope :category_order_updated_at, -> (category_id) {joins(:character_categories).where(character_categories: { category_id: category_id }).order(updated_at: :desc)}
  scope :category_order_past_topic, -> (category_id) {find_by_sql(
    ["SELECT ch.*, MAX(p.created_date) FROM characters ch
    INNER JOIN past_topics p ON p.character_id = ch.id
    INNER JOIN character_categories ca ON ca.character_id = ch.id
    WHERE ca.category_id = ?
    GROUP BY p.character_id
    ORDER BY max(p.created_date) DESC", category_id]
  )}
end