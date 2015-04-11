class Course < ActiveRecord::Base
  belongs_to :mentor

  has_many :enrollments
  has_many :users, through: :enrollments
end
