require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Organization, type: :model do
  describe 'association' do
    it { should belong_to(:owner) }
    it { should have_many(:members) }
    it { should have_many(:courses) }
  end

  it 'has a valid factory' do
    expect(build(:organization)).to be_valid
  end

  describe '.get_members_by_id' do
    it 'returns all members of the organization' do
      music_club = create(:organization)
      walt = create(:mentor, organization: music_club)
      hank = create(:mentor, organization: music_club)

      result = Mentors::Organization.get_members_by_id(music_club.id)
      expect(result).to match_array [walt, hank]
    end
  end
end
