class Category < ApplicationRecord
  has_many: characters, through :character_categories

  validates :name, presence: true
end
