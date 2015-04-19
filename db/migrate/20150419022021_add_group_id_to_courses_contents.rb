class AddGroupIdToCoursesContents < ActiveRecord::Migration
  def change
    add_reference :courses_contents, :group, index: true
  end
end
