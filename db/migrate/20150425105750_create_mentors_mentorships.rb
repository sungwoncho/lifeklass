class CreateMentorsMentorships < ActiveRecord::Migration
  def change
    create_table :mentors_mentorships do |t|
      t.references :mentor, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
