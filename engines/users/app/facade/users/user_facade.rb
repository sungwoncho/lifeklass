module Users
  class UserFacade

    attr_reader :user, :controller
    alias_method :c, :controller

    def initialize(user, controller = nil)
      @user       = user
      @controller = controller
    end

    def enrolled_course_list(view_context)
      return unless view_context.current_user.id == @user.id

      UserPresenter.new(@user, view_context).enrolled_course_list
    end

    def mentoring_courses
      return unless user.is_a_mentor?

      Mentors::Mentorship.get_courses_by_mentor_id(user.mentor_id)
    end

    def profile_heading(view_context)
      UserPresenter.new(@user, view_context).user_page_heading
    end

    private

    def method_missing(method, *args)
      args.empty? ? @user.send(method) : @user.send(method, *args)
    end
  end
end
