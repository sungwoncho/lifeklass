module Courses
  class Group < ActiveRecord::Base
    self.table_name = 'courses_groups'

    has_many :contents
  end
end
