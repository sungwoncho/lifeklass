require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Enrollment, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:course) }
  end

  it 'has a valid factory' do
    expect(build(:enrollment)).to be_valid
  end
end
