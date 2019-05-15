class Product < ApplicationRecord
	# アソシエーション
	has_many :discs, dependent: :destroy
end
