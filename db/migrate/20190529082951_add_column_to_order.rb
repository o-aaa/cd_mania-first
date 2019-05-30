class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :update_flag, :integer, default: 0
  end
end
