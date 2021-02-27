class Api::V1::CartItemsController < ApplicationController
  before_action :init_cart_item, only: :create

  def create
    puts @cartItem.nil?

    if @cartItem.nil?
      @cartItem = CartItem.new(cart_item_params)

      if @cartItem.save!
        render json: {msg: "Added new item to cart"}
      end
    else
      @cartItem.update(product_count: @cartItem.product_count + params['product_count'])

      render json: {msg: "Updated product count of cart item"}
    end
  end

  def destroy

  end

  private
  def cart_item_params
    {
      cart_id: params['cart_id'],
      product_id: params['product_id'],
      product_count: params['product_count'],
    }
  end

  def init_cart_item
    @cartItem = CartItem.find_by(cart_id: params['cart_id'], product_id: params['product_id'])
  end
end
