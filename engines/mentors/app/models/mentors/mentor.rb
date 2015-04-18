module Mentors
  class Mentor < ActiveRecord::Base

    self.table_name = 'mentors'

    belongs_to :user, class_name: "Users::User"
    has_many :courses, class_name: "Courses::Course"

    delegate :name, to: :user
  end
end
