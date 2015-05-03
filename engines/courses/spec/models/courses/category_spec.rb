require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:course_categories) }
    it { should have_many(:courses).through(:course_categories) }
  end

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end
end
