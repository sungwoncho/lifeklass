module Courses
  class ContentsController < ApplicationController

    before_action :authorize_access!
    before_action :authorize_instructor!, except: [:show]
    before_action :set_course

    def show
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

    def set_course
      @course = CourseFacade.new(course, self)
    end
  end
end
