class AddProductIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :product_id, :integer
  end
end
