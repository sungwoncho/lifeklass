module Courses
  class Course < ActiveRecord::Base
    self.table_name = 'courses'

    belongs_to :owner, polymorphic: true
    has_many :enrollments
    has_many :users, through: :enrollments
    has_many :course_categories
    has_many :categories, through: :course_categories
    has_many :contents

    validates :title, presence: true

    scope :by_title,      -> (title) { where("title ILIKE ?", "%#{title}%") if title }
    scope :by_category,   -> (categories) {
      joins(:categories).where(categories: {name: categories}) if categories.present?
    }
    scope :by_user_id,    -> (user_id) {
      joins(:enrollments).where(enrollments: {user_id: user_id})
    }

    def owner_is_organization?
      owner_type == 'Mentors::Organization'
    end

    def self.get_owner_by_id(course_id)
      find(course_id).owner
    end

    def mentors
      Mentors::Mentorship.get_mentors_by_course_id(self.id)
    end

    def mentees
      Courses::Enrollment.get_mentees_by_course_id(self.id)
    end
  end
end
