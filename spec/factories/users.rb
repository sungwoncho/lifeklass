FactoryGirl.define do
  sequence(:email) { |n| "user_#{n}@example.com" }

  factory :user do
    email
    password 'password'

    trait :as_mentor do
      after(:create) do |user|
        create(:mentor, user: user)
      end
    end
  end
end
