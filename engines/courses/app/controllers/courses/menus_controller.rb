module Courses
  class MenusController < ApplicationController

    before_action :authorize_access!, only: [:index, :show]
    before_action :authorize_instructor!, except: [:index, :show]
    before_action :set_course, only: [:index, :show, :edit]

    def index
    end

    def show
    end

    def edit
    end

    def create
      @menu = Course::Menu.new(menu_params)
      redirect_to course_menu_path(course, @menu) if @menu.save!
    end

    def update
      @menu = Courses::Menu.find(params[:id])

      if @menu.update_attributes!(menu_params)
        redirect_to edit_course_menu_path(course, @menu)
      end
    end

    def destroy
      @menu = Courses::Menu.find(params[:id])

      @menu.destroy!
      redirect_to menu_course_menus_path(course)
    end

    private

    def course
      Courses::Course.find(params[:course_id])
    end

    def set_course
      @course = Courses::CourseFacade.new(course, self)
    end

    def menu_params
      params.require(:menu).permit(:name)
    end

  end
end
