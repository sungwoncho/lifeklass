module Courses
  class CourseInformationController < ApplicationController
    layout 'application'

    def show
      set_course
    end

    private
      def set_course
        @course = Course.find(params[:id])
      end
  end
end
