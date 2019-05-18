class Song < ApplicationRecord
	# アソシエーション
	belongs_to :disc,  inverse_of: :songs

end
