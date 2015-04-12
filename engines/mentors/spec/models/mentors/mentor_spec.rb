require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::Mentor, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:courses) }
  end

  it 'has a valid factory' do
    expect(build(:mentor)).to be_valid
  end

  describe '#name' do
    it 'is delegated to user' do
      user = create(:user, name: 'Marco Polo')
      mentor = create(:mentor, user: user)

      expect(user).to receive(:name)
      mentor.name
    end
  end
end
