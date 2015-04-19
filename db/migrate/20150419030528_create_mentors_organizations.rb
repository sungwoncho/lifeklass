class CreateMentorsOrganizations < ActiveRecord::Migration
  def change
    create_table :mentors_organizations do |t|
      t.string :name
      t.text :description
      t.references :mentor, index: true

      t.timestamps null: false
    end
  end
end
