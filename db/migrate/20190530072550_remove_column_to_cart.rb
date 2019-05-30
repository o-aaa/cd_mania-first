class RemoveColumnToCart < ActiveRecord::Migration[5.2]
  def change
  	remove_column :carts, :ordered_flag, :string
  end
end
