include ActionDispatch::TestProcess

FactoryBot.define do
  factory :character_topic do
    # transient do
    #   user { FactoryBot.create(:user, :categories) }
    # end

    name         { Faker::Name.last_name }
    image        { fixture_file_upload('app/assets/images/guest_image.jpg', 'image/jpeg') }
    twitter_id   { Faker::Lorem.sentence }
    facebook_id  { Faker::Lorem.sentence }
    instagram_id { Faker::Lorem.sentence }
    describe     { Faker::Lorem.sentence }
    future_topic { Faker::Lorem.sentence }
    past_topic   { Faker::Lorem.sentence }
    created_date { "2022-07-01" }
    # user_id      { user.id }
    # category_ids { user.category_ids.sample(2) }
    user_id      { 1 }
    category_ids { [1,2] }
  end
end
