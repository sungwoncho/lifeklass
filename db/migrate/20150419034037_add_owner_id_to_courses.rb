class AddOwnerIdToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :owner, polymorphic: true, index: true
  end
end
