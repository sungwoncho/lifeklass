module Users
  class UserFacade

    attr_reader :user, :controller
    alias_method :c, :controller

    def initialize(user, controller = nil)
      @user       = user
      @controller = controller
    end

    def user_name
      user.name
    end

    def enrolled_courses
      Courses::Course.by_user_id(user.id)
    end

    def enrolled_course_list(view_context)
      return unless view_context.current_user.id == @user.id

      if enrolled_courses.present?
        view_context.render(partial: 'users/users/dashboard/enrolled_course', collection: enrolled_courses)
      else
        view_context.render(partial: 'users/users/dashboard/no_enrollment')
      end
    end

    def dashboard_title(view_context)
      view_context.current_user.id == @user.id ? 'Dashboard' : "#{@user.name}'s profile"
    end
  end
end
