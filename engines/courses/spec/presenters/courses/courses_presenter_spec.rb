require File.expand_path('engines/courses/spec/spec_helper')


RSpec.describe Courses::CoursesPresenter, type: :presenter do
  let(:courses) { [double(Courses::Course), double(Courses::Course)] }
  let(:view_context) { Courses::CoursesController.new.view_context }
  let(:courses_presenter) { Courses::CoursesPresenter.new(courses, view_context) }

  describe '#paginate' do
    it 'calls will_paginate to paginate the courses' do
      allow(view_context).to receive(:will_paginate)
      courses_presenter.paginate

      expect(view_context).to have_received(:will_paginate).with(courses)
    end
  end

  describe '#count' do
    it 'returns course count' do
      expect(courses_presenter.count).to eq 2
    end
  end
end
