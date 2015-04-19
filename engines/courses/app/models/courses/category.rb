module Courses
  class Category < ActiveRecord::Base
    self.table_name = 'categories'

    validates_presence_of :name
    has_many :course_categories
    has_many :courses, through: :course_categories
  end
end
