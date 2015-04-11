require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:mentor) }
  end
end
