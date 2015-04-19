module Mentors
  class Mentor < ActiveRecord::Base
    self.table_name = 'mentors'

    belongs_to :user, class_name: "Users::User"
    has_many :courses, class_name: "Courses::Course", as: :owner
    has_many :mentor_organizations
    has_many :organizations, through: :mentor_organizations

    delegate :name, to: :user

    # def is_instructor_of?(course)
    #   if course.owner_is_organization?
    #     is_a_member_of?(course.organization)
    #   else
    #     is_an_owner_of?(course)
    #   end
    # end

    def is_a_member_of?(organization)
      Mentors::MentorOrganization.get_members_by_id(organization.id).include?(self)
    end
  end
end
