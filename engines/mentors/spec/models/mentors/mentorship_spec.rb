require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Mentorship, type: :model do
  describe 'association' do
    it { should belong_to(:mentor) }
    it { should belong_to(:course) }
  end

  it 'has a valid factory' do
    expect(build(:mentorship)).to be_valid
  end

  describe '.get_mentors_by_course_id' do
    it 'returns all the mentors that has a mentorship to the course' do
      mma = create(:course)
      jim = create(:mentor)
      lily = create(:mentor)
      create(:mentorship, mentor: jim, course: mma)
      create(:mentorship, mentor: lily, course: mma)

      result = Mentors::Mentorship.get_mentors_by_course_id(mma.id)
      expect(result).to match_array [jim, lily]
    end
  end
end
