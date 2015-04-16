module Courses
  class CourseCategory < ActiveRecord::Base
    self.table_name = 'course_categories'

    belongs_to :course
    belongs_to :category
  end
end
