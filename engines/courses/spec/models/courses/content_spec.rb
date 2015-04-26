require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Content, type: :model do
  describe 'association' do
    it { should belong_to(:course) }
    it { should belong_to(:menu) }
  end

  it 'has a valid factory' do
    expect(build(:content)).to be_valid
  end
end
