module Courses
  class CoursePresenter < ApplicationPresenter

    def enroll_action
      return if h.current_user.is_mentor_of?(model)

      if h.current_user.enrolled_in?(model)
        h.render partial: 'courses/enrollments/drop_button', locals: { course: model }
      else
        h.render partial: 'courses/enrollments/enroll_button', locals: { course: model }
      end
    end

    def go_to_course
      if h.current_user.enrolled_in?(model) || h.current_user.is_mentor_of?(model)
        h.render partial: 'courses/enrollments/go_to_course', locals: { course: model }
      end
    end

    def menus
      Courses::Menu.by_course_id(model).by_position
    end

    def edit_course
      if h.current_user.is_mentor_of?(model)
        h.link_to 'Edit course information', h.course_app.edit_course_path(model), class: 'btn btn-default'
      end
    end

    def created_date
      model.created_at.strftime('%m/%d/%Y')
    end

    def mentee_count
      model.mentees.count
    end

  end
end
