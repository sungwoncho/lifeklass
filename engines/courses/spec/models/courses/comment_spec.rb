require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Comment, type: :model do
  describe 'association' do
    it { should belong_to(:owner) }
    it { should belong_to(:content) }
  end

  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end
end
