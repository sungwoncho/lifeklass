FactoryGirl.define do
  factory :enrollment, class: Courses::Enrollment do
    user { User.first || create(:user) }
    mentor { Mentors::Mentor.first || create(:mentor) }
  end
end
