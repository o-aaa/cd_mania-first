class RemoveDiscIdFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :disc_id, :intager
  end
end
