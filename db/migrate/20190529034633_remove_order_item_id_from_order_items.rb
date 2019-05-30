class RemoveOrderItemIdFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :order_item_id, :integer
  end
end
