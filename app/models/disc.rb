class Disc < ApplicationRecord
	# アソシエーション
	belongs_to :product
	has_many :songs, dependent: :destroy
end
