FactoryGirl.define do
  factory :enrollment, class: Courses::Enrollment do
    user { Users::User.first || create(:user) }
    course { Courses::Course.first || create(:course) }
  end
end
