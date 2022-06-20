FactoryBot.define do
  factory :character do
    name                  { Faker::Name.last_name }
    url                   { Faker::Internet.url }
    describe              { Faker::Lorem.sentence }
    association :user

    after(:build) do |character|
      character.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
