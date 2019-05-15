class Disc < ApplicationRecord
	# アソシエーション
	belongs_to :product
	has_many :songs, dependent: :destroy

	# 動的フォームの追加(Gem:nested_form_fields)
	accepts_nested_attributes_for :songs, allow_destroy: true

end
