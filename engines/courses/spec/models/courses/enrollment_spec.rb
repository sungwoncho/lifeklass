require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Enrollment, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:course) }
  end

  it 'has a valid factory' do
    expect(build(:enrollment)).to be_valid
  end

  describe '.get_courses_by_user_id' do
    it 'returns courses that user is enrolled in' do
      mma = create(:course)
      jim = create(:user)
      create(:enrollment, user: jim, course: mma)

      result = Courses::Enrollment.get_courses_by_user_id(jim)
      expect(result).to match_array [mma]
    end
  end

  describe '.get_mentees_by_course_id' do
    it 'returns users that enrolled in the course' do
      mma = create(:course)
      jim = create(:user)
      create(:enrollment, user: jim, course: mma)

      result = Courses::Enrollment.get_mentees_by_course_id(mma)
      expect(result).to match_array [jim]
    end
  end
end
