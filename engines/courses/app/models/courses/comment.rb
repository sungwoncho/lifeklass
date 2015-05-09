module Courses
  class Comment < ActiveRecord::Base
    has_ancestry

    belongs_to :owner, polymorphic: true
    belongs_to :content

    def posted_by?(commentor)
      owner == commentor
    end
  end
end
