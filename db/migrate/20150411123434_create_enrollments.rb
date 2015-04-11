class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :mentor, index: true

      t.timestamps null: false
    end
  end
end
