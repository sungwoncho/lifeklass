module Courses
  class Enrollment < ActiveRecord::Base

    self.table_name = 'enrollments'

    belongs_to :user
    belongs_to :mentor, class_name: "Mentors::Mentor"
  end
end
