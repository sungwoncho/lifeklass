require File.expand_path('engines/courses/spec/spec_helper')
include Rails.application.routes.url_helpers # Include this to test presenter with urls

RSpec.describe Courses::CoursePresenter, type: :presenter do
  let(:course) { create(:course) }
  let(:user) { create(:user) }
  let(:view_context) { Courses::CoursesController.new.view_context }
  let(:course_presenter) { Courses::CoursePresenter.new(course, view_context) }

  describe '#enroll_action' do
    context 'when current_user is already enrolled' do
      it 'displays drop button' do
        create(:enrollment, user: user, course: course)
        allow(view_context).to receive(:current_user).and_return(user)
        result = course_presenter.enroll_action

        expect(result).to match %(Drop Course)
      end
    end

    context 'when user is not enrolled' do
      it 'displays enroll button' do
        allow(view_context).to receive(:current_user).and_return(Users::User.new)
        result = course_presenter.enroll_action

        expect(result).to match %(Enroll)
      end
    end
  end

  describe '#go_to_course' do
    context 'when user is enrolled' do
      it 'displays the go to class button' do
        create(:enrollment, user: user, course: course)
        allow(view_context).to receive(:current_user).and_return(user)
        result = course_presenter.go_to_course

        expect(result).to match %(Go to course)
      end
    end

    context 'when user is not enrolled' do
      it 'displays nothing' do
        create(:enrollment, user: user, course: course)
        allow(view_context).to receive(:current_user).and_return(Users::User.new)
        result = course_presenter.go_to_course

        expect(result).to eq nil
      end
    end
  end
end
