class CartSerializer < ActiveModel::Serializer
  attributes :id

  has_many :cart_items

  class CartItemSerializer < ActiveModel::Serializer
    attributes :product, :product_count

    def product
      Product.find(object.product_id)
    end
  end
end
