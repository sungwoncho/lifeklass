require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Mentor, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:courses) }
  end

  it 'has a valid factory' do
    expect(build(:mentor)).to be_valid
  end
end
