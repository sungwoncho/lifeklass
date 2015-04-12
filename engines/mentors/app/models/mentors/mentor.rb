module Mentors
  class Mentor < ActiveRecord::Base

    self.table_name = 'mentors'

    belongs_to :user
    has_many :courses, class_name: "Courses::Course"

    delegate :name, to: :user
  end
end
