class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :mentor
  has_many :enrollments, class_name: "Courses::Enrollment"
  has_many :courses, through: :enrollments, class_name: "Courses::Course"
end
