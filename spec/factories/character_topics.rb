include ActionDispatch::TestProcess

FactoryBot.define do
  factory :character_topic do
    transient do
      user { FactoryBot.create(:user, :categories) }
    end

    name         { Faker::Name.last_name }
    image        { fixture_file_upload('public/images/test_image.png', 'test_image.png') }
    url          { Faker::Internet.url }
    describe     { Faker::Lorem.sentence }
    future_topic { Faker::Lorem.sentence }
    past_topic   { Faker::Lorem.sentence }
    created_date { "2022-07-01" }
    user_id      { user.id }
    category_ids { user.category_ids.sample(2) }
  end
end
