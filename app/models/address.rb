class Address < ApplicationRecord
	# アソシエーション
	belongs_to :user
	has_many :orders, dependent: :destroy

	validates :post_num, length: { is: 7 }

end