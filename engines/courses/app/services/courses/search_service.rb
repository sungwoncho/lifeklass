module Courses
  class SearchService

    attr_reader :params

    def initialize(params)
      @params = params || {}
    end

    def call
      Course.includes(:categories).
      by_title(title).by_category(categories).references(:categories)
    end

    private

    def title
      @params[:title]
    end

    def categories
      @params[:categories]
    end
  end
end
