class Order < ApplicationRecord
	# アソシエーション
	belongs_to :address
	has_many :order_items, dependent: :destroy

	# enumのintegerを文字列に変換 カラム名{文字列: 0, 文字列: 1, ...}
	enum delivery_status:{Please_select: 0, Unshipp: 1, Shipped: 2}
end
