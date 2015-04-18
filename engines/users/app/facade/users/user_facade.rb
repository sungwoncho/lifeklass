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

    def enrolled_course_list(view_context)
      return unless view_context.current_user.id == @user.id

      UserPresenter.new(@user, view_context).enrolled_course_list
    end

    def user_page_heading(view_context)
      UserPresenter.new(@user, view_context).user_page_heading
    end
  end
end
