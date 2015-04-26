FactoryGirl.define do
  factory :menu, class: Courses::Menu do
    name 'Week 1'
    course { create(:course) }
  end
end
