module Courses
  class MenusController < ApplicationController
    before_action :authorize_access, only: [:index, :show]
    before_action :authorize_instructor, except: [:index, :show]

    def index
      @course = Courses::CourseFacade.new(course)
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

    def menus
      Courses::Menu.find_by(course_id: params[:course_id])
    end

    def authorize_access
      authorize course, :access?
    end

    def authorize_instructor
      authorize course, :update?
    end
  end
end
