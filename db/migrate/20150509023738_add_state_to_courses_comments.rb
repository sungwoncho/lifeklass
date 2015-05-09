class AddStateToCoursesComments < ActiveRecord::Migration
  def change
    add_column :courses_comments, :state, :string
  end
end
