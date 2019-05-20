class Song < ApplicationRecord
	# アソシエーション
	belongs_to :disc,  inverse_of: :songs

	validates :song_title, presence: true


end
