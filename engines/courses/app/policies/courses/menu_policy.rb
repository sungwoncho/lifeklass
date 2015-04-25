module Courses
  class MenuPolicy < ::ApplicationPolicy
    attr_reader :user, :menu

    def initialize(user, menu)
      @user   = user || Users::User.new
      @menu   = menu
    end

    def edit
      mentor && mentor.is_instructor_of?(course)
    end

    private

    def mentor
      @mentor ||= user.mentor
    end

    def course
      @course ||= Course.find_by(menu_id: @menu.id)
    end
  end
end
