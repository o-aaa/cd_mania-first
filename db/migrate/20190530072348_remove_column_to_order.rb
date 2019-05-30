class RemoveColumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :ordered_flag, :string
  end
end
