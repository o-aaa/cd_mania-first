class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :addresses, dependent: :destroy
  belongs_to :default_address, foreign_key: "default_address", primary_key: :id, class_name: "Address"
  has_many :favorites, dependent: :destroy
  has_many :carts, dependent: :destroy


  # Addressモデルにデータを送る
  accepts_nested_attributes_for :addresses


end
