require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::ContentGroup, type: :model do
  describe 'association' do
    it { should have_many(:contents) }
    it { should belong_to(:course) }
  end
end
