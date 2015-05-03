module Courses
  class ContentPresenter < ApplicationPresenter

    def posted_on
      model.created_at.strftime('%m/%d/%Y')
    end
  end
end
