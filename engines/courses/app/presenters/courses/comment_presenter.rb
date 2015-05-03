module Courses
  class CommentPresenter < ApplicationPresenter

    def owner_name
      model.owner.name
    end

    def posted_on
      model.created_at.strftime('%m/%d/%Y')
    end
  end
end
