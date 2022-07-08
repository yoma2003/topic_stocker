FactoryBot.define do
  factory :category do
    name     { Faker::Name.last_name }
    describe { Faker::Lorem.sentence }
    association :user
  end
end
