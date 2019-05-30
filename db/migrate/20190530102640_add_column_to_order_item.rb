class AddColumnToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :product_id, :integer
    add_column :order_items, :bought_count, :integer
  end
end
