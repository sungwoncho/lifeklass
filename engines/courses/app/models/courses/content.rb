module Courses
  class Content < ActiveRecord::Base
    self.table_name = 'courses_contents'

    belongs_to :course
    belongs_to :menu
    has_many :comments

    scope :by_course_id, -> (course_id) { where(course_id: course_id) }
    scope :by_menu_id,   -> (menu_id) { where(menu_id: menu_id) }
  end
end
