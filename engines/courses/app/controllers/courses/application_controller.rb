module Courses
  class ApplicationController < ::ApplicationController
    layout 'course'

    private

    def authorize_access!
      authorize course, :access?
    end

    def authorize_instructor!
      authorize course, :update?
    end

  end
end
