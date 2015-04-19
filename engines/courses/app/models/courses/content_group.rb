module Courses
  class ContentGroup < ActiveRecord::Base
    self.table_name = 'courses_content_groups'

    has_many :contents
    belongs_to :course
  end
end
