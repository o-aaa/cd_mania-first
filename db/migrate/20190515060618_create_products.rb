class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :disc_name
      t.string :artist
      t.integer :price
      t.date :release_date
      t.text :cover_image_id
      t.string :label
      t.integer :genre, default: 0
      t.integer :buy_status, default: 0
      t.integer :stocks

      t.timestamps
    end
  end
end
