FactoryGirl.define do
  factory :course, class: Courses::Course do
    owner { Mentors::Mentor.first || create(:mentor) }
    title 'Self Improvement Course'
    description 'Course description about the self improvement course'

    trait :by_organization do
      owner { Mentors::Organization.first || create(:organization) }
    end

    trait :self_improvement do
      after(:create) do |course|
        category = create(:category, name: 'self_improvement')
        create(:course_category, course_id: course.id, category_id: category.id)
      end
    end

    trait :entrepreneurship do
      title 'Entrepreneurship course'

      after(:create) do |course|
        category = create(:category, name: 'entrepreneurship')
        create(:course_category, course_id: course.id, category_id: category.id)
      end
    end

    trait :wealth do
      title 'Wealth course'

      after(:create) do |course|
        category = create(:category, name: 'wealth')
        create(:course_category, course_id: course.id, category_id: category.id)
      end
    end
  end
end
