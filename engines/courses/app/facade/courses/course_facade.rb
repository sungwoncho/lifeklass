module Courses
  class CourseFacade

    attr_reader :course

    def initialize(course)
      @course = course
    end

    def menus
      Courses::Menu.by_course_id(@course)
    end

  end
end
