class RemoveTrackNumFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :track_num, :integer
  end
end
