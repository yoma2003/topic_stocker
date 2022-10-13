FactoryBot.define do
  factory :user do
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    uid                   { "123456878901234567890" }
    provider              { "google" }
    image                 { Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/guest_image.jpg"), 'image/jpeg') }
  end

  # after(:build) do |user|
  #   user.image.attach(io:File.open('app/assets/images/guest_image.jpg'), filename: 'guest_image.jpg')
  # end
  
  # trait :categories do
  #   after(:create) do |user|
  #     user.categories = create_list(:category, 5, user: user)
  #   end
  # end
end