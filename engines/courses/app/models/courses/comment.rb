module Courses
  class Comment < ActiveRecord::Base
    has_ancestry

    belongs_to :owner, polymorphic: true
    belongs_to :content
  end
end
