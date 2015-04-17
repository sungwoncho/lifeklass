module Courses
  class Course < ActiveRecord::Base

    self.table_name = 'courses'

    belongs_to :mentor, class_name: "Mentors::Mentor"
    has_many :enrollments
    has_many :users, through: :enrollments
    has_many :course_categories
    has_many :categories, through: :course_categories

    scope :by_title, -> (title) { where("title ILIKE ?", "%#{title}%") if title }
    scope :by_category, -> (categories) {
      joins(:categories).where("categories.name in (?)", categories) if categories
    }
  end
end
