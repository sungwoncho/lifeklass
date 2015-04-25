module Mentors
  class Organization < ActiveRecord::Base
    self.table_name = 'mentors_organizations'

    belongs_to :owner, class_name: 'Mentor', foreign_key: 'mentor_id'
    has_many :members, class_name: 'Mentor'
    has_many :courses, class_name: 'Courses::Course', as: :owner

    scope :by_course_id, -> course_id { joins(:courses).where("courses.id = ?", course_id) }

    def self.get_members_by_course_id(course_id)
      joins(:courses).where(courses: { id: course_id }, owner: self)
    end
  end
end
