require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Mentor, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:courses) }
    it { should have_many(:mentor_organizations) }
    it { should have_many(:organizations).through(:mentor_organizations) }
  end

  it 'has a valid factory' do
    expect(build(:mentor)).to be_valid
  end

  describe '#name' do
    it 'is delegated to user' do
      user = create(:user, name: 'Marco Polo')
      mentor = create(:mentor, user: user)

      expect(user).to receive(:name)
      mentor.name
    end
  end

  describe '#is_a_member_of?' do
    let(:music_group) { create(:organization) }

    context 'when the member belongs to the organization' do
      it 'returns true' do
        walt = create(:mentor)
        create(:mentor_organization, mentor: walt, organization: music_group)

        result = walt.is_a_member_of?(music_group)
        expect(result).to eq true
      end
    end

    context 'when the member does not belong to the organization' do
      it 'returns false' do
        walt = create(:mentor)

        result = walt.is_a_member_of?(music_group)
        expect(result).to eq false
      end
    end
  end
end
