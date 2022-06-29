class Category < ApplicationRecord
  belongs_to :user
  has_many :characters, through: :character_categories

  validates :name, presence: true
end
