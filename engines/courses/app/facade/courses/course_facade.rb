module Courses
  class CourseFacade

    attr_reader :course

    def initialize(course)
      @course = course
    end

    def menus
      Courses::Menu.by_course_id(@course)
    end

    def mentors
      Mentors::Mentorship.get_mentors_by_course_id(course.id)
    end

    def mentor_names
      mentors.map(&:name)
    end

    private

    def method_missing(method, *args)
      args.empty? ? course.send(method) : course.send(method, *args)
    end

  end
end
