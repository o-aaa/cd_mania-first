class Order < ApplicationRecord
	# アソシエーション
	belongs_to :address
	has_many :order_items, dependent: :destroy

	enum payment:{Cash_on_delivery: 0,Creditcard: 1,Bank_transfer: 2}
	# enumのintegerを文字列に変換 カラム名{文字列: 0, 文字列: 1, ...}
	enum delivery_status:{Unshipp: 0, Shipped: 1}
end



