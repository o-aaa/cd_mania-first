class RemoveProductIdFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :product_id, :integer
  end
end
