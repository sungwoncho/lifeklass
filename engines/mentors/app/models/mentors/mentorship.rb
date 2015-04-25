module Mentors
  class Mentorship < ActiveRecord::Base
    belongs_to :mentor
    belongs_to :course, class_name: Courses::Course

    scope :by_course_id, -> course_id { where(course_id: course_id) }
    scope :by_mentor_id, -> mentor_id { where(mentor_id: mentor_id) }

    def self.get_mentor_ids_by_course_id(course_id)
      by_course_id(course_id).pluck(:mentor_id)
    end

    def self.get_mentors_by_course_id(course_id)
      mentor_ids = get_mentor_ids_by_course_id(course_id)
      Mentors::Mentor.where(id: mentor_ids)
    end
  end
end
