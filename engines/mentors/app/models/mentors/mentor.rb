module Mentors
  class Mentor < ActiveRecord::Base
    self.table_name = 'mentors'

    belongs_to :user, class_name: "Users::User"
    belongs_to :organization
    has_many :courses, class_name: "Courses::Course", as: :owner

    delegate :name, to: :user

    scope :by_organization_id, -> (organization_id) {
      where(organization_id: organization_id)
    }

    # def is_instructor_of?(course)
    #   if course.owner_is_organization?
    #     is_a_member_of?(course.organization)
    #   else
    #     is_an_owner_of?(course)
    #   end
    # end

    def is_a_member_of?(organization)
      Mentors::Mentor.by_organization_id(organization.id).include?(self)
    end
  end
end
