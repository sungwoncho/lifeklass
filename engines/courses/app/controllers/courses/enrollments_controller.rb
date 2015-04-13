module Courses
  class EnrollmentsController < ApplicationController
    before_action :set_course, only: [:create, :destroy]

    def create
      EnrollService.new(@course, current_user).call
    end

    def destroy
      DisenrollService.new(@course, current_user).call
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
