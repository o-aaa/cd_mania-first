class RemoveLebelFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :label, :string
  end
end
