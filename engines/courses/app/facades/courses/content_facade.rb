module Courses
  class ContentFacade
    attr_reader :content, :controller
    alias_method :c, :controller

    def initialize(content, controller = nil)
      @content     = content
      @controller  = controller
    end

    def menu
      Courses::Menu.find(c.params[:menu_id])
    end

    def course
      Courses::Course.find(c.params[:course_id])
    end

    private

    def method_missing(method, *args)
      args.empty? ? @content.send(method) : @content.send(method, *args)
    end
  end
end
