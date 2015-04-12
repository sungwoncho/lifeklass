require 'rails_helper'

RSpec.describe Mentor, type: :model do
  describe 'association' do
    it { should belong_to :user }
  end

  it 'has a valid factory' do
    expect(build(:mentor)).to be_valid
  end
end
