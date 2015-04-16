require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Category do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:course_categories) }
  end
end
