class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.integer :address_id
    	t.string :post_num
    	t.string :address
    	t.integer :shipping_address
    	t.integer :user_id
    	t.string :delivery_last_name
    	t.string :delivery_first_name
    	t.string :delivery_last_name_kana
    	t.string :delivery_first_name_kana

      t.timestamps
    end
  end
end
