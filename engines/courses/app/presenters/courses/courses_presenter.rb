module Courses
  class CoursesPresenter < ApplicationPresenter

    def paginate
      h.will_paginate model
    end

    def count
      model.count
    end
  end
end
