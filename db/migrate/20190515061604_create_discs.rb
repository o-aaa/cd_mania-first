class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :disc_id
      t.integer :disc_type, default: 0
      t.integer :disc_num, default: 0
      t.integer :product_id

      t.timestamps
    end
  end
end
