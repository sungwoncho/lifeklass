module Courses
  class MenusController < ApplicationController
    before_action :authorize_access, only: [:index, :show]
    before_action :authorize_instructor, except: [:index, :show]
    before_action :set_course

    def index
    end

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
      @course = Courses::CourseFacade.new(course, self)
    end

    def authorize_access
      authorize course, :access?
    end

    def authorize_instructor
      authorize course, :update?
    end
  end
end
