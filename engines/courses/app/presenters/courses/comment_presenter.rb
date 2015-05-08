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
  end
end
