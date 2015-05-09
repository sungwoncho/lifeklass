require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Course, type: :model do
  describe 'association' do
    it { should belong_to(:owner) }
    it { should have_many(:users) }
    it { should have_many(:course_categories) }
    it { should have_many(:categories).through(:course_categories) }
    it { should have_many(:contents) }
  end

  it 'has a valid factory' do
    expect(build(:course)).to be_valid
  end

  describe '#owner_is_organization?' do
    let(:course) { Courses::Course.new }

    context 'when the owner type is organization' do
      it 'returns true' do
        allow(course).to receive(:owner_type).and_return("Mentors::Organization")

        expect(course.owner_is_organization?).to eq true
      end
    end

    context 'when the owner type is not organization' do
      it 'returns false' do
        allow(course).to receive(:owner_type).and_return("Mentors::Mentor")

        expect(course.owner_is_organization?).to eq false
      end
    end
  end

  describe '#mentors' do
    it 'asks Mentors::Mentorship to get all mentors for the course' do
      course = Courses::Course.new
      allow(course).to receive(:id).and_return(1)

      expect(Mentors::Mentorship).to receive(:get_mentors_by_course_id).with(1)
      course.mentors
    end
  end

  describe '#mentees' do
    it 'asks Courses::Enrollment to get all mentees for the course' do
      course = Courses::Course.new
      allow(course).to receive(:id).and_return(1)

      expect(Courses::Enrollment).to receive(:get_mentees_by_course_id).with(1)
      course.mentees
    end
  end
end
