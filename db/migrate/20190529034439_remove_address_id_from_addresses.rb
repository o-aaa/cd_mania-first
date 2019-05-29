class RemoveAddressIdFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_id, :integer
  end
end
