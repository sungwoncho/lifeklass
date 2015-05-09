module Courses
  class ContentPresenter < ApplicationPresenter

    def posted_on
      model.created_at.strftime('%m/%d/%Y')
    end

    def edit_button
      if h.current_user.is_mentor_of?(h.current_course)
        h.link_to 'Edit Content', h.course_app.edit_course_menu_content_path(h.current_course, h.current_menu, model)
      end
    end

    def delete_button
      if h.current_user.is_mentor_of?(h.current_course)
        h.link_to 'Delete Content', h.course_menu_content_path(h.current_course, h.current_menu, model), method: :delete, data: { confirm: 'Are you sure?' }
      end
    end
  end
end
