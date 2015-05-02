module Courses
  class CoursesFacade

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

    def categories
      Category.all
    end
  end
end
