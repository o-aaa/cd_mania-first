class OrderItem < ApplicationRecord
	# アソシエーション
	belongs_to :order
	belongs_to :cart
	belongs_to :product
end
