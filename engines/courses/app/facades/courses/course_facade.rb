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
      Courses::Menu.find(menu_params) if menu_params
    end

    def mentors
      Mentors::Mentorship.get_mentors_by_course_id(@course.id)
    end

    def current_menu_contents
      return unless current_menu
      Courses::Content.by_menu_id(current_menu.id).by_course_id(@course)
    end

    def current_content
      return unless c.controller_name == 'contents'

      current_content = Courses::Content.find(c.params[:id])
      Courses::ContentFacade.new(current_content, c)
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
