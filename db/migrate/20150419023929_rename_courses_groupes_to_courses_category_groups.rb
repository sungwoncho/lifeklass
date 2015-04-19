class RenameCoursesGroupesToCoursesCategoryGroups < ActiveRecord::Migration
  def change
    rename_table :courses_groups, :courses_content_groups
  end
end
