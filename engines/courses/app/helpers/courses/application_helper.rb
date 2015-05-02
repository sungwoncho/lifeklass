module Courses
  module ApplicationHelper
    def current_menu
      if controller_name == 'menus'
        Courses::Menu.find(params[:id])
      else
        Courses::menu.find(params[:menu_id])
      end
    end

    def current_course
      if controller_name == 'courses'
        Courses::Course.find(params[:id])
      else
        Courses::Course.find(params[:course_id])
      end
    end
  end
end
