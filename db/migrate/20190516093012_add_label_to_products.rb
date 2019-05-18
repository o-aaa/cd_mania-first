class AddLabelToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :label, :string
  end
end
