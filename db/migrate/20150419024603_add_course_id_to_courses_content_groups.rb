class AddCourseIdToCoursesContentGroups < ActiveRecord::Migration
  def change
    add_reference :courses_content_groups, :course, index: true
  end
end
