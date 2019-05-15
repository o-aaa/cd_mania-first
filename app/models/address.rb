class Address < ApplicationRecord
	# アソシエーション
	belongs_to :user
	has_many :orders, dependent: :destroy
end
