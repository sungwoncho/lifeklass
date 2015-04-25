require File.expand_path('engines/courses/spec/spec_helper')
require 'pundit/rspec'

RSpec.describe Courses::CoursePolicy, type: :policy do
  subject { described_class }
  let(:user) { user = Users::User.new }
  let(:mentor) { mentor = Mentors::Mentor.new }
  let(:course) { course = Courses::Course.new }

  permissions :access? do
    it 'denies access if user is not enrolled in the course' do
      expect(subject).not_to permit(user, course)
    end

    it 'denies access if mentor is not an instructor of the course' do
      allow(user).to receive(:mentor).and_return(mentor)

      expect(subject).not_to permit(user, course)
    end
  end
end
