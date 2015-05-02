module Mentors
  class NullMentor
    def is_mentor_of?(course)
      false
    end

    def mentoring_courses
      []
    end
  end
end
