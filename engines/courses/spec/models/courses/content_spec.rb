require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Content, type: :model do
  describe 'association' do
    it { should belong_to(:course) }
    it { should belong_to(:content_group) }
  end
end
