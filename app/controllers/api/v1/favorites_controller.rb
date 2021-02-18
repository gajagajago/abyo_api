class Api::V1::FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(product_id: params['product_id'], user: current_user)

    if @favorite.save!
      render json: @favorite
    end
  end

  def destroy
    @favorite = Favorite.find_by(product_id: params['product_id'], user: current_user)

    if @favorite.destroy
      render json: { msg: "Success" }
    end
  end
end
