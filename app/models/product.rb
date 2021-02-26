class Product < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
