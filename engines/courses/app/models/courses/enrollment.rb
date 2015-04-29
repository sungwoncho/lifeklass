module Courses
  class Enrollment < ActiveRecord::Base

    self.table_name = 'enrollments'

    belongs_to :user, class_name: "Users::User"
    belongs_to :course, class_name: "Courses::Course"

    scope :by_user_id, -> user_id { where(user_id: user_id) }

    def self.get_course_ids_by_user_id(user_id)
      by_user_id(user_id).pluck(:course_id)
    end

    def self.get_courses_by_user_id(user_id)
      course_ids = get_course_ids_by_user_id(user_id)
      Courses::Course.where(id: course_ids)
    end
  end
end
