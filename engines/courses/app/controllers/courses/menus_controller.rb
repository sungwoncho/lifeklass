module Courses
  class MenusController < ApplicationController

    before_action :authorize_access!, only: [:index, :show]
    before_action :authorize_instructor!, except: [:index, :show]

    def index
      @menus = Courses::Menu.where(course_id: current_course)
    end

    def show
      @contents = Courses::Content.where(menu_id: params[:id]).paginate(page: params[:page], per_page: 10)
    end

    def edit
      @menu = Courses::Menu.find(params[:id])
    end

    def create
      @menu = Courses::Menu.new(menu_params)
      @menu.course = current_course
      redirect_to course_menu_path(current_course, @menu) if @menu.save!
    end

    def update
      @menu = Courses::Menu.find(params[:id])

      if @menu.update!(menu_params)
        redirect_to edit_course_menu_path(current_course, @menu)
      end
    end

    def destroy
      @menu = Courses::Menu.find(params[:id])

      @menu.destroy!
      redirect_to menu_course_menus_path(current_course)
    end

    private

    def menu_params
      params.require(:menu).permit(:name, :position)
    end

  end
end
