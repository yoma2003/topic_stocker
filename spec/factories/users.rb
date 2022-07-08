FactoryBot.define do
  factory :user do
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end

  trait :categories do
    after(:create) do |user|
      user.categories = create_list(:category, 5, user: user)
    end
  end
end
