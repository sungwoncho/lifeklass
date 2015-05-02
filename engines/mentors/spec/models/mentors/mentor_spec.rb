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

  describe '#is_member_of?' do
    let(:music_group) { create(:organization) }

    context 'when the member belongs to the organization' do
      it 'returns true' do
        walt = create(:mentor)
        create(:mentor_organization, mentor: walt, organization: music_group)

        result = walt.is_member_of?(music_group)
        expect(result).to eq true
      end
    end

    context 'when the member does not belong to the organization' do
      it 'returns false' do
        walt = create(:mentor)

        result = walt.is_member_of?(music_group)
        expect(result).to eq false
      end
    end
  end

  describe '#is_owner_of_course?' do
    let(:course) { double(Courses::Course) }
    let(:walt) { create(:mentor) }

    context 'when the mentor is the owner of the course' do
      it 'returns true' do
        allow(course).to receive(:owner).and_return(walt)

        result = walt.is_owner_of_course?(course)
        expect(result).to eq true
      end
    end

    context 'when the mentor is not the owner of the course' do
      it 'returns false' do
        allow(course).to receive(:owner).and_return(double(Mentors::Mentor))

        result = walt.is_owner_of_course?(course)
        expect(result).to eq false
      end
    end

    context 'when the course is owned by an organization' do
      it 'returns false' do
        allow(course).to receive(:owner).and_return(double(Mentors::Organization))

        result = walt.is_owner_of_course?(course)
        expect(result).to eq false
      end
    end
  end

  describe '#is_mentor_of?' do
    let(:course) { Courses::Course.new }
    let(:mentor) { Mentors::Mentor.new }

    context 'if the mentor is an instructor of the course' do
      it 'returns true' do
        create(:mentorship, mentor: mentor, course: course)

        result = mentor.is_mentor_of?(course)
        expect(result).to eq true
      end
    end

    context 'if the mentor is not an instructor of the course' do
      it 'returns false' do
        result = mentor.is_mentor_of?(course)
        expect(result).to eq false
      end
    end
  end
end
