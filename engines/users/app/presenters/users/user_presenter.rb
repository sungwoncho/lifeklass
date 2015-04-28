module Users
  class UserPresenter < ApplicationPresenter

    def firstname
      name_components.first.humanize
    end

    def lastname
      name_components.last.humanize
    end

    def enrolled_course_list
      if enrolled_courses.present?
        h.render(partial: 'users/users/dashboard/course', collection: enrolled_courses)
      else
        h.render(partial: 'users/users/dashboard/no_enrollment')
      end
    end

    def user_page_heading
      h.current_user.id == model.id ? 'Dashboard' : "#{model.name}'s profile"
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
