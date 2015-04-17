require 'rails_helper'

RSpec.describe Courses::CourseCategory, type: :model do
  describe 'association' do
    it { should belong_to(:course) }
    it { should belong_to(:category) }
  end

  it 'has a valid factory' do
    expect(build(:course_category)).to be_valid
  end
end
