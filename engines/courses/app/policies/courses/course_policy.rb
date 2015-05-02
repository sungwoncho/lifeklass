module Courses
  class CoursePolicy < ::ApplicationPolicy
    attr_reader :user, :course

    def initialize(user, course)
      @user   = user || Users::User.new
      @course = course
    end

    def access?
      user.enrolled_in?(course) || mentor.is_mentor_of?(course)
    end

    def update?
      mentor.is_mentor_of?(course)
    end

    private

    def mentor
      @mentor = user.mentor || Mentors::Mentor.new
    end

  end
end
