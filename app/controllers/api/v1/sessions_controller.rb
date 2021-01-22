class Api::V1::SessionsController < Devise::SessionsController
  before_action :load_user, only: [:create]

  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in @user
      render json: @user
    else
      render json: {msg: "wrong password"}
    end
  end

  private
  def sign_in_params
    params.require(:session).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])

    if (@user)
      @user
    else
      render json: { msg: "invalid email" }
    end
  end
end
