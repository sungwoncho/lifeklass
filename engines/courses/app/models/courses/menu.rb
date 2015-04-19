module Courses
  class Menu < ActiveRecord::Base
    has_many :contents
    belongs_to :course
  end
end
