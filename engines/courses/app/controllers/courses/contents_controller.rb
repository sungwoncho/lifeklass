module Courses
  class ContentsController < ApplicationController

    before_action :authorize_access!, only: [:show]
    before_action :authorize_instructor!, except: [:show]
    before_action :set_content, only: [:show, :edit, :update, :destroy]

    def show
      @comments = Courses::Comment.where(content_id: @content).arrange(order: :created_at)
    end

    def new
      @content = Courses::Content.new
    end

    def edit
    end

    def create
      @content = Courses::Content.new(content_params.merge(course_id: current_course.id, menu_id: current_menu.id))

      if @content.save!
        redirect_to course_menu_content_path(current_course, current_menu, @content)
      end
    end

    def update
      if @content.update!(content_params)
        redirect_to course_menu_content_path(current_course, current_menu, @content)
      end
    end

    def destroy
      if @content.destroy!
        redirect_to course_menu_path(current_course, current_menu)
      end
    end

    private

    def set_content
      @content = Courses::Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :body)
    end
  end
end
