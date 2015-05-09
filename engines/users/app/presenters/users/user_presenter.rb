module Users
  class UserPresenter < ApplicationPresenter

    def firstname
      name_components.first.humanize
    end

    def lastname
      name_components.last.humanize
    end

    def mentor_badge
      h.render 'users/users/dashboard/mentor_badge' if model.is_a_mentor?
    end

    def joined_date
      model.created_at.strftime('%m/%d/%Y')
    end

    def enrollment_count
      "Have enrolled in #{ h.pluralize user.enrolled_courses.count, 'course' }" if user.enrolled_courses.present?
    end

    def mentorship_count
      "Have mentored in #{ h.pluralize user.mentoring_courses.count, 'course' }" if user.mentoring_courses.present?
    end

    def new_course_button
      h.link_to 'New course', h.course_app.new_course_path, class: 'btn btn-default' if model.is_a_mentor?
    end

    def enrolled_date(course)
      model.enrolled_since(course).strftime("%m/%d/%Y")
    end

    private

    def name_components
      model.name.split(/\s+/)
    end

    def enrolled_courses
      Courses::Course.by_user_id(self.id)
    end
  end
end
