class RemoveSubtotalFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :subtotal, :integer
  end
end
