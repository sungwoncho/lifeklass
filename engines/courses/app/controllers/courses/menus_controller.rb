module Courses
  class MenusController < ApplicationController

    before_action :authorize_access!, only: [:index, :show]
    before_action :authorize_instructor!, except: [:index, :show]
    before_action :set_menu, only: [:index, :edit]

    def index
    end

    def show
      @contents = Courses::Content.where(menu_id: params[:id]).paginate(page: params[:page], per_page: 10)
    end

    def edit
    end

    def create
      @menu = Courses::Menu.new(menu_params)
      @menu.course = course
      redirect_to course_menu_path(course, @menu) if @menu.save!
    end

    def update
      @menu = Courses::Menu.find(params[:id])

      if @menu.update!(menu_params)
        redirect_to edit_course_menu_path(course, @menu)
      end
    end

    def destroy
      @menu = Courses::Menu.find(params[:id])

      @menu.destroy!
      redirect_to menu_course_menus_path(course)
    end

    private

    def set_menu
      @menu = Courses::Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :position)
    end

  end
end
