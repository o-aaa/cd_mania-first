class RemoveReleaseDateFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :release_date, :date
  end
end
