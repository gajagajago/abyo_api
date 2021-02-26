class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def self.init_user_cart(user)
    Cart.create(user: user)
  end
end