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

  describe '#is_instructor_of?' do
    context 'when the course is owned by organization' do
      let(:course) { create(:course, :by_organization) }
      let(:mentor) { Mentors::Mentor.new }

      context 'when the mentor is a member of that organization' do
        it 'returns true' do
          allow(mentor).to receive(:is_member_of?).with(course.owner).and_return(true)

          expect(mentor.is_instructor_of?(course)).to eq true
        end
      end

      context 'when the mentor is not a member of that organization' do
        it 'returns false' do
          allow(mentor).to receive(:is_member_of?).with(course.owner).and_return(false)

          expect(mentor.is_instructor_of?(course)).to eq false
        end
      end
    end

    context 'when the course is owned by a mentor' do
      let(:course) { create(:course) }
      let(:mentor) { Mentors::Mentor.new }

      context 'when the mentor is that mentor' do
        it 'returns true' do
          allow(mentor).to receive(:is_owner_of_course?).and_return(true)

          expect(mentor.is_instructor_of?(course)).to eq true
        end
      end

      context 'when the mentor is not that mentor' do
        it 'returns false' do
          allow(mentor).to receive(:is_owner_of_course?).and_return(false)

          expect(mentor.is_instructor_of?(course)).to eq false
        end
      end
    end
  end
end
