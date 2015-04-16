module Courses
  class CourseQuery
    def initialize
      @relation = Course
    end

    def by_title(title)
      @relation.where("title ILIKE ?", "%#{title}%")
    end
  end
end
