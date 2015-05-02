require File.expand_path('engines/courses/spec/spec_helper')


RSpec.describe Courses::CoursesPresenter, type: :presenter do
  let(:courses) { [double(Courses::Course), double(Courses::Course)] }
  let(:view_context) { Courses::CoursesController.new.view_context }
  let(:courses_presenter) { Courses::CoursesPresenter.new(courses, view_context) }
end
