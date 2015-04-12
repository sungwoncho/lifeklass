class ChangeMentorIdToCourseId < ActiveRecord::Migration
  def change
    rename_column :enrollments, :mentor_id, :course_id
  end
end
