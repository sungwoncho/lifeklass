class AddPositionToCoursesMenus < ActiveRecord::Migration
  def change
    add_column :courses_menus, :position, :integer, default: 0
  end
end
