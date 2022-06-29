class PastTopic < ApplicationRecord
  belongs_to :character

  validates :created_date, presence: true
end
