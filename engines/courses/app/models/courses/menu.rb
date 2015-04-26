module Courses
  class Menu < ActiveRecord::Base
    has_many :contents, dependent: :destroy
    belongs_to :course

    validates :name, uniqueness: { scope: :course_id }

    scope :by_course_id, -> course_id { where(course_id: course_id) }
  end
end
