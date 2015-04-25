module Courses
  class CourseSearchFacade

    attr_reader :search_params, :controller
    alias_method :c, :controller

    def initialize(search_params, controller = nil)
      @search_params = search_params
      @controller    = controller
    end

    def courses
      SearchService.new(search_params).call.paginate(page: c.params[:page], per_page: 10)
    end

    def course_count
      return unless courses
      CoursesPresenter.new(courses).count
    end

    def paginate(view_context)
      return unless courses
      CoursesPresenter.new(courses, view_context).paginate
    end

    def categories
      Category.all
    end
  end
end
