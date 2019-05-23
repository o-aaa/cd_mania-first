class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :addresses, :shipping_address, :integer, default: 0
  end

  # 変更前の状態
  def down
    change_column :addresses, :shipping_address, :integer
  end
end
