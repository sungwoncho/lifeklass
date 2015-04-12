FactoryGirl.define do
  factory :enrollment, class: Courses::Enrollment do
    user { User.first || create(:user) }
    mentor { Mentor.first || create(:mentor) }
  end
end
