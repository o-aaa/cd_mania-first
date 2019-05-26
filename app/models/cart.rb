class Cart < ApplicationRecord
	# アソシエーション
	belongs_to :user
	belongs_to :product

	# 論理削除(Gem:paranoia)を使用
    acts_as_paranoid

    def subtotal
    	product.price * buy_count
    end

end