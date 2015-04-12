FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'

    trait :as_mentor do
      after(:create) do |user|
        create(:mentor, user: user)
      end
    end
  end
end
