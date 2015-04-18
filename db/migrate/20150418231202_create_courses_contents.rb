class CreateCoursesContents < ActiveRecord::Migration
  def change
    create_table :courses_contents do |t|
      t.string :title
      t.text :body
      t.references :course, index: true

      t.timestamps null: false
    end
  end
end
