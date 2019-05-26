class OrderItem < ApplicationRecord
	# アソシエーション
	belongs_to :order
	belongs_to :cart
end
