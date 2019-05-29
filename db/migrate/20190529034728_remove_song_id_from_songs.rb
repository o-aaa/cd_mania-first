class RemoveSongIdFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_id, :integer
  end
end
