class Api::V1::StocksController < ApplicationController
  def index
    @stock = Stock.all

    render json: @stock
  end
end
