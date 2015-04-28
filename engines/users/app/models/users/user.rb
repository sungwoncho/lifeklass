module Users
  class User < ActiveRecord::Base

    self.table_name = 'users'

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_one :mentor, class_name: "Mentors::Mentor"
    has_many :enrollments, class_name: "Courses::Enrollment"
    has_many :courses, through: :enrollments, class_name: "Courses::Course"

    delegate :id, to: :mentor, prefix: :mentor, allow_nil: true

    def is_a_mentor?
      Mentors::Mentor.find_by(user_id: self.id).present?
    end

    def enrolled_in?(course_id)
      Courses::Enrollment.find_by(user_id: self.id, course_id: course_id).present?
    end
  end
end
