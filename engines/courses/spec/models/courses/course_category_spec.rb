require 'rails_helper'

RSpec.describe Courses::CourseCategory, type: :model do
  describe 'association' do
    it { should belong_to(:course) }
    it { should belong_to(:category) }
  end
end
