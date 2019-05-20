class Product < ApplicationRecord
	# アソシエーション
	 has_many :discs, inverse_of: :product
	 accepts_nested_attributes_for :discs
	 # dependent: :destroy
	has_many :carts, dependent: :destroy
	attachment :image

	enum genre:{POP: 0,Enka: 1,Rock: 2,Classic: 3,Dance: 4,Jazz: 5,Reghe: 6,Heavy_metal: 7,Idol: 8,Anime: 9,Others: 10}
	enum buy_status:{Now_on_Sale: 0,Stop: 1}
	enum disc_type:{Single: 0,Album: 1}
	
	validates :artist, presence: true
	validates :disc_name, presence: true
	validates :price, presence: true
	validates :label, presence: true
	validates :stocks, presence: true

end