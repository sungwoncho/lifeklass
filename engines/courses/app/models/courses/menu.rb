module Courses
  class Menu < ActiveRecord::Base
    has_many :contents
    belongs_to :course

    scope :by_course_id, -> course_id { where(course_id: course_id) }
  end
end
