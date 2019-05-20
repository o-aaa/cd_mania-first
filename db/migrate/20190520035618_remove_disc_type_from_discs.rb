class RemoveDiscTypeFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :disc_type, :integer
  end
end
