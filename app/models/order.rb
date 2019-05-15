class Order < ApplicationRecord
	# アソシエーション
	belongs_to :address
	has_many :order_items, dependent: :destroy
end