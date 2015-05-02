module Courses
  module MenusHelper
    def current_menu
      Courses::Menu.find(menu_params) if menu_params
    end

    def menu_params
      case controller_name
      when 'menus'
        params[:id]
      when 'contents'
        params[:menu_id]
      end
    end
  end
end
