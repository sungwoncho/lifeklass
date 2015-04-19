class AddOrganizationIdToMentors < ActiveRecord::Migration
  def change
    add_reference :mentors, :organization, index: true
  end
end
