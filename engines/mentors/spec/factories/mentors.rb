FactoryGirl.define do
  factory :mentor, class: Mentors::Mentor do
    user { User.first || create(:user) }
  end
end
