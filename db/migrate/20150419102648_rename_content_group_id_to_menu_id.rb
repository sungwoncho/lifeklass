class RenameContentGroupIdToMenuId < ActiveRecord::Migration
  def change
    rename_column :courses_contents, :content_group_id, :menu_id
  end
end
