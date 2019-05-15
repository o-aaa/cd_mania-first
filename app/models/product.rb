class Product < ApplicationRecord
	# アソシエーション
	has_many :discs, dependent: :destroy
	has_many :carts, dependent: :destroy

end
