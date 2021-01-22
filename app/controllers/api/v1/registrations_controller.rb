class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(sign_up_params)

    if @user.save
      render json: @user
    else
      render json: { msg: "fail" }
    end
  end

  private
  def sign_up_params
    params.require(:registration).permit(:name, :email, :password)
  end
end
