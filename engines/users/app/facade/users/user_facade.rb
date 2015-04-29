module Users
  class UserFacade

    attr_reader :user, :controller
    alias_method :c, :controller

    def initialize(user, controller = nil)
      @user       = user
      @controller = controller
    end

    def enrolled_courses
      Courses::Enrollment.get_courses_by_user_id(@user.id)
    end

    def mentoring_courses
      Mentors::Mentorship.get_courses_by_mentor_id(user.mentor_id)
    end

    private

    def method_missing(method, *args)
      args.empty? ? @user.send(method) : @user.send(method, *args)
    end
  end
end
