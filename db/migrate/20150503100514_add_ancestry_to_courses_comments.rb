class AddAncestryToCoursesComments < ActiveRecord::Migration
  def change
    add_column :courses_comments, :ancestry, :string
    add_index :courses_comments, :ancestry
  end
end
