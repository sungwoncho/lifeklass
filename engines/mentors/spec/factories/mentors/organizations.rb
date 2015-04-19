FactoryGirl.define do
  factory :organization, class: Mentors::Organization do
    name 'Speech Group'
    description 'Improve your speaking'
    mentor_id 1
  end
end
