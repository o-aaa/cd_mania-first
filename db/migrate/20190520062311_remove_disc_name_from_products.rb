class RemoveDiscNameFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :disc_name, :string
  end
end
