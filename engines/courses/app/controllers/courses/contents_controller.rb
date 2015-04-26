module Courses
  class ContentsController < ApplicationController

    before_action :authorize_access!, only: [:show]
    before_action :authorize_instructor!, except: [:show]
    before_action :set_course

    def show
    end

    def new
    end

    def edit
    end

    def create
      @content = Courses::Content.new(content_params.merge(course_id: course.id, menu_id: @course.current_menu.id))

      if @content.save!
        redirect_to course_menu_content_path(course, @course.current_menu, @content)
      end
    end

    def update
      @content = Courses::Content.find(params[:id])

      if @content.update!(content_params)
        redirect_to course_menu_content_path(course, @course.current_menu, @content)
      end
    end

    def destroy
      @content = Courses::Content.find(params[:id])

      if @content.destroy!
        redirect_to course_menu_path(course, @course.current_menu)
      end
    end

    private

    def course
      Courses::Course.find(params[:course_id])
    end

    def set_course
      @course = CourseFacade.new(course, self)
    end

    def content_params
      params.require(:content).permit(:title, :body)
    end
  end
end
