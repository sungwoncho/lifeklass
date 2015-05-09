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

    def reply_button
      unless model.posted_by?(h.current_user)
        h.link_to 'Reply', '#', class: 'reply-btn', data: { parent_id: model.id }
      end
    end
  end
end
