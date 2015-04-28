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

    def self.get_course_ids_by_mentor_id(mentor_id)
      by_mentor_id(mentor_id).pluck(:course_id)
    end

    def self.get_courses_by_mentor_id(mentor_id)
      course_ids = get_course_ids_by_mentor_id(mentor_id)
      Courses::Course.where(id: course_ids)
    end
  end
end
