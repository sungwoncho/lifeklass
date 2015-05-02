module Courses
  class CreateCourseService

    attr_reader :mentor, :params

    def initialize(mentor, params)
      @mentor = mentor
      @params = params
    end

    def self.call(mentor, params)
      new(mentor, params).call
    end

    def call
      create_course
      create_mentorship
      set_ownership
      assign_categories

      @course
    end

    private

    def course_params
      params.slice(:title, :description)
    end

    def category_ids
      params[:category_ids]
    end

    def create_course
      @course = Courses::Course.create!(course_params)
    end

    def create_mentorship
      Mentors::Mentorship.create!(mentor_id: mentor.id, course_id: @course.id)
    end

    def set_ownership
      @course.update_attributes!(owner: mentor)
    end

    def assign_categories
      category_ids.each do |category_id|
        Courses::CourseCategory.create!(course_id: @course.id, category_id: category_id)
      end
    end
  end
end
