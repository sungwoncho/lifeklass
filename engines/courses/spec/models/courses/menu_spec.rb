require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Menu, type: :model do
  describe 'association' do
    it { should have_many(:contents).dependent(:destroy) }
    it { should belong_to(:course) }
  end

  describe 'validation' do
    it { should validate_uniqueness_of(:name).scoped_to(:course_id) }
    it { should validate_numericality_of(:position).only_integer }
  end

  it 'has a valid factory' do
    expect(build(:menu)).to be_valid
  end
end
