module Courses
  class Comment < ActiveRecord::Base
    belongs_to :owner, polymorphic: true
    belongs_to :content
  end
end
