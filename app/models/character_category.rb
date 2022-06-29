class CharacterCategory < ApplicationRecord
  belongs_to :character
  belongs_to :category
end
