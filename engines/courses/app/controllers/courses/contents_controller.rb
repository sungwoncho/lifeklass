module Courses
  class ContentsController < ApplicationController

    def show
      @course = CourseFacade.new(course, self)
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def course
      Courses::Course.find(params[:course_id])
    end
  end
end
