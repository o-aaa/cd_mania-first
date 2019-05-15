class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :song_id
      t.integer :track_num
      t.string :song_title
      t.integer :disc_id

      t.timestamps
    end
  end
end
