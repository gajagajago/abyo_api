class Api::V1::AssetsController < ApplicationController
  def index
    @asset = current_user.assets

    render json: @asset
  end

end
