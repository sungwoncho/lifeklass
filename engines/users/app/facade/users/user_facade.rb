module Users
  class UserFacade

    attr_reader :user, :controller
    alias_method :c, :controller

    def initialize(user, controller = nil)
      @user       = user
      @controller = controller
    end

    def user_name
      user.full_name
    end

    def enrolled_courses
      Courses::Course.by_user_id(user.id)
    end

    def enrolled_course_list(view_context)
      if enrolled_courses.present?
        view_context.render(partial: 'users/users/dashboard/enrolled_course', collection: enrolled_courses)
      else
        view_context.render(partial: 'users/users/dashboard/no_enrollment')
      end
    end
  end
end
