class CreateCoursesGroups < ActiveRecord::Migration
  def change
    create_table :courses_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
