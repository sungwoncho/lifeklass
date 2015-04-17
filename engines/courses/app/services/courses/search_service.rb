module Courses
  class SearchService

    attr_reader :params

    def initialize(params)
      @params = params || {}
    end

    def call
      Course.by_title(title).by_category(categories)
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
