module Mentors
  class Mentor < ActiveRecord::Base
    self.table_name = 'mentors'

    belongs_to :user, class_name: "Users::User"
    has_many :courses, class_name: "Courses::Course", as: :owner
    has_many :mentor_organizations
    has_many :organizations, through: :mentor_organizations

    delegate :name, to: :user

    scope :by_course_id, -> course_id { joins(:courses).where("courses.id = ?", course_id) }

    def is_instructor_of?(course)
      Mentors::Mentorship.get_mentors_by_course_id(course.id).include?(self)
    end

    def is_member_of?(organization)
      Mentors::MentorOrganization.get_members_by_id(organization.id).include?(self)
    end

    def is_owner_of_course?(course)
      course.owner == self
    end
  end
end
