class AddDiscTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :disc_type, :integer
  end
end
