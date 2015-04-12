class Mentor < ActiveRecord::Base
  belongs_to :user
  has_many :courses, class_name: "Courses::Course"
end
