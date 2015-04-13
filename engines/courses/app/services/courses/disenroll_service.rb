module Courses
  class DisenrollService

    attr_reader :course, :user

    def initialize(course, user)
      @course = course
      @user = user
    end

    def call
      disenroll!
    end

    private

    def disenroll!
      if user.enrolled_in?(course.id)
        Enrollment.find_by(user_id: user.id, course_id: course.id).destroy!
      end
    end
  end
end
