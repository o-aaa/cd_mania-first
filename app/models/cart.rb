class Cart < ApplicationRecord
	# アソシエーション
	belongs_to :user
	belongs_to :product
	has_one :order_item

	# 論理削除(Gem:paranoia)を使用
    acts_as_paranoid
end
