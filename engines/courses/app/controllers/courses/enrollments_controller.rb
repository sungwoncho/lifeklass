module Courses
  class EnrollmentsController < ApplicationController
    before_action :set_course, only: [:create, :destroy]

    def create
      EnrollService.new(@course, current_user).call
      render nothing: true # TODO: Return JS
    end

    def destroy
      DisenrollService.new(@course, current_user).call
      render nothing: true
    end

    private

    def set_course
      @course = Courses::Course.find(params[:id])
    end
  end
end
