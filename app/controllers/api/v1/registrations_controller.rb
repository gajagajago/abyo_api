class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(sign_up_params)

    if @user.save!
      Asset.init_user_assets(@user)
      Cart.init_user_cart(@user)
      sign_in @user

      render json: @user
    else
      render json: { msg: "fail sign up" }
    end
  end

  private
  def sign_up_params
    params.require(:registration).permit(:name, :email, :password)
  end
end
