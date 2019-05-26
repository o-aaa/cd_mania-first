class AddSubtotalToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :subtotal, :integer
  end
end
