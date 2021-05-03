class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :user_id, :creator_id
  end
end
