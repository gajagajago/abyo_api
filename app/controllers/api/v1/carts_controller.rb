class Api::V1::CartsController < ApplicationController
  def index
    @cart = current_user.cart

    render json: @cart
  end
end

