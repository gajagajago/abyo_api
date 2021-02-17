class Api::V1::ProductsController < ApplicationController
  def index
    @product = Product.all

    render json: @product
  end
end
