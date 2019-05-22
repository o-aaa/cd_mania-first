class AddReleaseDateToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :release_date, :string
  end
end
