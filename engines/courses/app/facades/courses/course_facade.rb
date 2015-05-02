module Courses
  class CourseFacade

    attr_reader :course, :controller
    alias_method :c, :controller

    def initialize(course, controller = nil)
      @course     = course
      @controller = controller
    end

    def current_menu_contents
      return unless current_menu
      Courses::Content.by_menu_id(current_menu.id).by_course_id(@course).paginate(page: c.params[:page], per_page: 10)
    end

    def current_content
      return unless c.controller_name == 'contents'
      current_content = Courses::Content.find(c.params[:id])
    end

    def new_content
      return unless current_menu
      Courses::Content.new(course: @course, menu: current_menu)
    end

    private

    def method_missing(method, *args)
      args.empty? ? course.send(method) : course.send(method, *args)
    end
  end
end
