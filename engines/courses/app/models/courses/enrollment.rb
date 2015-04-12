module Courses
  class Enrollment < ActiveRecord::Base

    self.table_name = 'enrollments'

    belongs_to :user
    belongs_to :course, class_name: "Courses::Course"
  end
end
