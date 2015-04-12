require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Course, type: :model do
  describe 'association' do
    it { should belong_to(:mentor) }
    it { should have_many(:users) }
  end

  it 'has a valid factory' do
    expect(build(:course)).to be_valid
  end
end