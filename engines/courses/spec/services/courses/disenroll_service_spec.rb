require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::DisenrollService, type: :service do
  let(:disenroll_service) { Courses::DisenrollService.new(course, user) }

  describe '#call' do
    let(:course) { create(:course) }
    let(:user) { create(:user) }

    context 'when user is enrolled in the course' do
      before(:each) do
        create(:enrollment, user_id: user.id, course_id: course.id)
      end

      it 'deletes an enrollment record' do
        expect {
          disenroll_service.call
        }.to change(Courses::Enrollment, :count).by(-1)
      end
    end

    context 'when user is not enrolled in the course' do
      it 'does not delete an enrollment record' do
        expect {
          disenroll_service.call
        }.to change(Courses::Enrollment, :count).by(0)
      end
    end
  end
end
