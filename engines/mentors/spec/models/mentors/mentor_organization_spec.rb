require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::MentorOrganization, type: :model do
  describe 'association' do
    it { should belong_to(:mentor) }
    it { should belong_to(:organization) }
  end

  describe '.get_mentor_ids_by_organization_id' do
    it 'returns mentor_ids for the organization' do
      music_group = create(:organization)
      walt = create(:mentor)
      create(:mentor_organization, mentor: walt, organization: music_group)

      result = Mentors::MentorOrganization.get_mentor_ids_by_organization_id(music_group.id)
      expect(result).to match_array [walt.id]
    end
  end

  describe '.get_members_by_id' do
    it 'returns all members of the organization' do
      music_club = create(:organization, name: 'music_club')
      walt = create(:mentor)
      hank = create(:mentor)
      create(:mentor_organization, mentor: walt, organization: music_club)
      create(:mentor_organization, mentor: hank, organization: music_club)

      result = Mentors::MentorOrganization.get_members_by_id(music_club.id)
      expect(result).to match_array [walt, hank]
    end
  end
end
