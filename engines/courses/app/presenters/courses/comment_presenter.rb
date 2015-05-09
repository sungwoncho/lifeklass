module Courses
  class CommentPresenter < ApplicationPresenter

    def owner_name
      model.owner.name
    end

    def posted_on
      model.created_at.strftime('%m/%d/%Y')
    end

    def posted_ago
      "#{h.time_ago_in_words(model.created_at)} ago"
    end

    def body
      if model.active?
        h.simple_format(model.body)
      else
        "[Comment deleted]"
      end
    end

    def reply_button
      unless model.posted_by?(h.current_user) || !model.active?
        h.link_to 'Reply', '#', class: 'reply-btn', data: { parent_id: model.id }
      end
    end

    def edit_button
      if model.posted_by?(h.current_user) && model.active?
        h.link_to 'Edit', '#', class: 'edit-btn'
      end
    end

    def delete_button
      if model.posted_by?(h.current_user) && model.active?
        h.link_to 'Delete', h.course_menu_content_comment_path(h.current_course, h.current_menu, h.current_content, model), method: :delete
      end
    end
  end
end
