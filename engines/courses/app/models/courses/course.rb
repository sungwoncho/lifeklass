module Courses
  class Course < ActiveRecord::Base

    self.table_name = 'courses'

    belongs_to :mentor

    has_many :enrollments
    has_many :users, through: :enrollments
  end
end
