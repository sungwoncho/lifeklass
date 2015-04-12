require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_one(:mentor) }
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end