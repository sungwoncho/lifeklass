class CreateMentorsMentorOrganizations < ActiveRecord::Migration
  def change
    create_table :mentors_mentor_organizations do |t|
      t.references :mentor, index: true
      t.references :organization, index: true

      t.timestamps null: false
    end
  end
end
