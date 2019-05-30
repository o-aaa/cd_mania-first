class AddDeletedAtToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :deleted_at, :string
  end
end
