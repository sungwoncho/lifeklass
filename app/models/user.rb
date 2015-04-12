class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :mentor
  has_many :enrollments, class_name: "Courses::Enrollment"
  has_many :courses, through: :enrollments, class_name: "Courses::Course"

  def is_a_mentor?
    Mentor.find_by(user_id: self.id).present?
  end
end
