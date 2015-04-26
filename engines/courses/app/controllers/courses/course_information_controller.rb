module Courses
  class CourseInformationController < ApplicationController
    layout 'application'

    def show
      set_course
    end

    def edit
    end

    def update
    end

    private
      def set_course
        @course = CoursePresenter.new(course, view_context)
      end

      def course
        Course.find(params[:id])
      end
  end
end
