module Mentors
  class Organization < ActiveRecord::Base
    self.table_name = 'mentors_organizations'

    belongs_to :owner, class_name: 'Mentor', foreign_key: 'mentor_id'
    has_many :members, class_name: 'Mentor'
    has_many :courses, class_name: 'Courses::Course', as: :owner

    def self.get_members_by_id(organization_id)
      Mentors::Mentor.by_organization_id(organization_id)
    end
  end
end
