FactoryGirl.define do
  factory :mentor, class: Mentors::Mentor do
    user { ::Users::User.first || create(:user) }
  end
end
