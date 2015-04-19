module Courses
  class Content < ActiveRecord::Base
    self.table_name = 'courses_contents'

    belongs_to :course
    belongs_to :group

    scope :by_course_id, -> (course_id) { where(course_id: course_id) }
  end
end
