module Courses
  class ContentsFacade
    attr_reader :contents, :course_id, :controller
    alias_method :c, :controller

    def initialize(course_id, controller = nil)
      @course_id     = course_id
      @controller    = controller
    end

    def contents
      @contents ||= Content.where(course_id: @course_id)
    end

    def course_title
      Course.find(@course_id).title
    end
  end
end
