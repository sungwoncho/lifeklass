FactoryGirl.define do
  factory :mentorship, class: Mentors::Mentorship do
    mentor { create(:mentor) }
    course { create(:course) }
  end
end
