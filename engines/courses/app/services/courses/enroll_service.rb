module Courses
  class EnrollService

    attr_reader :course, :user

    def initialize(course, user)
      @course = course
      @user = user
    end

    def call
      enroll!
    end

    private

    def enroll!
      unless user.enrolled_in?(course.id)
        Enrollment.create!(course_id: @course.id, user_id: user.id)
      end
    end
  end
end
