module Courses
  class CoursePresenter < ApplicationPresenter

    def enroll_action_for(user)
      if user.enrolled_in?(model)
        h.render partial: 'courses/enrollments/drop_button', locals: { course: model }
      else
        h.render partial: 'courses/enrollments/enroll_button', locals: { course: model }
      end
    end

    def go_to_course(user)
      if user.enrolled_in?(model)
        h.render partial: 'courses/enrollments/go_to_course', locals: { course: model }
      end
    end

    def menus
      Courses::Menu.by_course_id(model).by_position
    end

  end
end
