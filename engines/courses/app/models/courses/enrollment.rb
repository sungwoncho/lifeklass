module Courses
  class Enrollment < ActiveRecord::Base

    self.table_name = 'enrollments'

    belongs_to :user, class_name: "Users::User"
    belongs_to :course, class_name: "Courses::Course"

    scope :by_user_id, -> user_id { where(user_id: user_id) }
    scope :by_course_id, -> course_id { where(course_id: course_id) }

    def self.get_course_ids_by_user_id(user_id)
      by_user_id(user_id).pluck(:course_id)
    end

    def self.get_courses_by_user_id(user_id)
      course_ids = get_course_ids_by_user_id(user_id)
      Courses::Course.where(id: course_ids)
    end

    def self.get_mentees_by_course_id(course_id)
      user_ids = by_course_id(course_id).pluck(:user_id)
      Users::User.where(id: user_ids)
    end
  end
end
