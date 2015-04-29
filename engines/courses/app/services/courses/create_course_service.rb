module Courses
  class CreateCourseService

    attr_reader :mentor, :course_params

    def initialize(mentor, course_params)
      @mentor        = mentor
      @course_params = course_params
    end

    def self.call(mentor, course_params)
      new(mentor, course_params).call
    end

    def call
      create_course!
      create_mentorship!

      @course
    end

    private

    def create_course!
      @course = Courses::Course.create!(course_params)
    end

    def create_mentorship!
      Mentors::Mentorship.create!(mentor_id: mentor.id, course_id: @course.id)
    end
  end
end
