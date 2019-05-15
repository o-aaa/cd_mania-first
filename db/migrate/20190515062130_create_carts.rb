class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :cart_id
      t.integer :buy_count
      t.integer :user_id
      t.integer :product_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
