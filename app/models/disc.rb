class Disc < ApplicationRecord
	# アソシエーション
	belongs_to :product, inverse_of: :discs
	has_many :songs, inverse_of: :disc

	# 動的フォームの追加(Gem:nested_form_fields)
	accepts_nested_attributes_for :songs, allow_destroy: true


	enum disc_type:{Single: 0,Album: 1}

end