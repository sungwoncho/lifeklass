module Users
  class User < ActiveRecord::Base

    self.table_name = 'users'

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_one :mentor, class_name: "Mentors::Mentor"
    has_many :enrollments, class_name: "Courses::Enrollment"
    has_many :courses, through: :enrollments, class_name: "Courses::Course"

    delegate :mentoring_courses, to: :mentor
    delegate :is_mentor_of?    , to: :mentor

    def is_a_mentor?
      Mentors::Mentor.find_by(user_id: self.id).present?
    end

    def enrolled_in?(course_id)
      Courses::Enrollment.find_by(user_id: self.id, course_id: course_id).present?
    end

    def enrolled_since(course)
      Courses::Enrollment.find_by(user_id: self.id, course_id: course.id).created_at if enrolled_in?(course.id)
    end

    def enrolled_courses
      Courses::Enrollment.get_courses_by_user_id(self.id)
    end

    def mentor
      Mentors::Mentor.find_by(user_id: self.id) || Mentors::NullMentor.new
    end
  end
end
