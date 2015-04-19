require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Group, type: :model do
  describe 'association' do
    it { should have_many(:contents) }
  end
end
