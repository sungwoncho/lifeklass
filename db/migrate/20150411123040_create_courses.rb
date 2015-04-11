class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :mentor, index: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
