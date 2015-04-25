module Courses
  class CourseFacade

    attr_reader :course, :controller
    alias_method :c, :controller

    def initialize(course, controller = nil)
      @course     = course
      @controller = controller
    end

    def menus
      Courses::Menu.by_course_id(@course)
    end

    def current_menu
      Courses::Menu.find(menu_params).name if menu_params
    end

    def mentors
      Mentors::Mentorship.get_mentors_by_course_id(@course.id)
    end

    private

    def method_missing(method, *args)
      args.empty? ? course.send(method) : course.send(method, *args)
    end

    def menu_params
      case c.controller_name
      when 'menus'
        c.params[:id]
      when 'contents'
        c.params[:menu_id]
      end
    end

  end
end
