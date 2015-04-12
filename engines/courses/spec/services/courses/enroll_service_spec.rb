require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::EnrollService, type: :service do
  let(:enroll_service) { Courses::EnrollService.new(course, user) }

  describe '#call' do
    let(:course) { create(:course) }
    let(:user) { create(:user) }

    context 'when user is not already enrolled' do
      it 'creates an enrollment record' do
        expect {
          enroll_service.call
        }.to change(Courses::Enrollment, :count).by(1)
      end
    end

    context 'when user is already enrolled' do
      before(:each) do
        create(:enrollment, user_id: user.id, course_id: course.id)
      end

      it 'does not create an enrollment record' do
        expect {
          enroll_service.call
        }.to change(Courses::Enrollment, :count).by(0)
      end
    end
  end
end
