module Courses
  class ContentsController < ApplicationController

    # def index
    #   @contents_facade = ContentsFacade.new(params[:course_id], self)
    # end

    def show
      @course = CourseFacade.new(course, self)
      @content = Content.find(params[:id])
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

    def menu
      Courses::Menu.find(params[:menu_id])
    end
  end
end
