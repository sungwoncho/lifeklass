FactoryGirl.define do
  factory :comment, class: Courses::Comment do
    owner { create(:user) }
    content
    body 'Thanks for the great material'
  end
end
