class RemoveDiscIdFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :disc_id, :integer
  end
end
