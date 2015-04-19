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
end
