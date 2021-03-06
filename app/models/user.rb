class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :addresses, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :carts, dependent: :destroy

  # Addressモデルにデータを送る
  accepts_nested_attributes_for :addresses

  validates :phone_num, length: { in: 10..11 }

end
