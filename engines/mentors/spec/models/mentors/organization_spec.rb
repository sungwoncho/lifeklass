require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Organization, type: :model do
  describe 'association' do
    it { should belong_to(:owner) }
    it { should have_many(:mentors) }
    it { should have_many(:courses) }
  end

  it 'has a valid factory' do
    expect(build(:organization)).to be_valid
  end
end
