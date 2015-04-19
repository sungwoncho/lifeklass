class RenameContentGroupsToMenus < ActiveRecord::Migration
  def change
    rename_table :courses_content_groups, :courses_menus
  end
end
