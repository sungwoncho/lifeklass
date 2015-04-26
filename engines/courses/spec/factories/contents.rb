FactoryGirl.define do
  factory :content, class: Courses::Content do
    title "Ain't nobody got no time for that"
    body "I said, ain't nobody got no time for that!"
    course
    menu
  end
end
