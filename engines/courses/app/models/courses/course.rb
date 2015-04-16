module Courses
  class Course < ActiveRecord::Base

    self.table_name = 'courses'

    belongs_to :mentor, class_name: "Mentors::Mentor"
    has_many :enrollments
    has_many :users, through: :enrollments
  end
end
