class CreateCoursesComments < ActiveRecord::Migration
  def change
    create_table :courses_comments do |t|
      t.references :owner, polymorphic: true, index: true
      t.references :content, index: true
      t.text :body

      t.timestamps null: false
    end
  end
end
