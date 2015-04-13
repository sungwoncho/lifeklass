module Courses
  class CoursePresenter < ApplicationPresenter

    def enroll_action_for(user)
      if user.enrolled_in?(model)
        h.render partial: 'courses/enrollments/drop_button', locals: { course: model }
      else
        h.render partial: 'courses/enrollments/enroll_button', locals: { course: model }
      end
    end
  end
end
