class Order < ApplicationRecord
	# アソシエーション
	belongs_to :address
	has_many :order_items, dependent: :destroy

	enum payment:{Cash_on_delivery: 0,Creditcard: 1,Bank_transfer: 2}

	
end



