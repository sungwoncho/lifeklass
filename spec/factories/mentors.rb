FactoryGirl.define do
  factory :mentor do
    user { User.first || create(:user) }
  end
end
