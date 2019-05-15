class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_item_id
      t.integer :cart_id
      t.integer :buy_price
      t.integer :order_id

      t.timestamps
    end
  end
end
