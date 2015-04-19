module Mentors
  class Mentor < ActiveRecord::Base

    self.table_name = 'mentors'

    belongs_to :user, class_name: "Users::User"
    belongs_to :organization
    has_many :courses, class_name: "Courses::Course", as: :owner

    delegate :name, to: :user
  end
end
