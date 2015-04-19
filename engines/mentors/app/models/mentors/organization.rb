module Mentors
  class Organization < ActiveRecord::Base
    self.table_name = 'mentors_organizations'

    belongs_to :owner, class_name: 'Mentor', foreign_key: 'mentor_id'
    has_many :mentors
    has_many :courses, class_name: 'Courses::Course', as: :owner
  end
end
