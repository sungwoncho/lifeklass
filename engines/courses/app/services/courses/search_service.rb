module Courses
  class SearchService

    attr_reader :params

    def initialize(params)
      @params = params || {}
    end

    def call
      Course.by_title(title)
    end

    private

    def title
      @params[:title]
    end
  end
end
