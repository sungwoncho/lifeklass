FactoryGirl.define do
  factory :course, class: Courses::Course do
    mentor { Mentors::Mentor.first || create(:mentor) }
    title 'Self Improvement Course'
    description 'Course description about the self improvement course'
  end
end
