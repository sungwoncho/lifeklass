class RemoveMentorIdInCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :mentor_id, :integer
  end
end
