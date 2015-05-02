module Courses
  class ApplicationController < ::ApplicationController
    layout 'course'
    helper_method :current_course, :current_menu

    def current_course
      if controller_name == 'courses'
        Courses::Course.find(params[:id])
      else
        Courses::Course.find(params[:course_id])
      end
    end

    def current_menu
      if controller_name == 'menus'
        Courses::Menu.find(params[:id])
      elsif controller_name == 'contents'
        Courses::Menu.find(params[:menu_id])
      end
    end

    private

    def authorize_access!
      authorize current_course, :access?
    end

    def authorize_instructor!
      authorize current_course, :update?
    end
  end
end
