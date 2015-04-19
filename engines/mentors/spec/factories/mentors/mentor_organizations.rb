FactoryGirl.define do
  factory :mentor_organization, class: Mentors::MentorOrganization do
    mentor { create(:mentor) }
    organization { create(:organiztion) }
  end
end
