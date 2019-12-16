class ChangeNameThreadpostToComment < ActiveRecord::Migration[6.0]
  def change
    rename_table :thread_posts, :comments
  end
end
