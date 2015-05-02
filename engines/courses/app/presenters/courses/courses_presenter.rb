module Courses
  class CoursesPresenter < ApplicationPresenter

    def count
      model.count
    end
  end
end
