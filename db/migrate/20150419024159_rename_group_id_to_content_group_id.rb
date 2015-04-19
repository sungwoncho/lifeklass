class RenameGroupIdToContentGroupId < ActiveRecord::Migration
  def change
    rename_column :courses_contents, :group_id, :content_group_id
  end
end
