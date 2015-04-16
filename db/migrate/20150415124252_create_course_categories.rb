class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.references :course, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
