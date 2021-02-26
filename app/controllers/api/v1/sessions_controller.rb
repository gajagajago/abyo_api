class Api::V1::SessionsController < Devise::SessionsController
  before_action :load_user, only: :create
  before_action :validate_token, only: :destroy
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in @user
      render json: @user
    else
      render json: {msg: "wrong password"}
    end
  end

  def destroy
    sign_out @user
    @user.generate_new_authentication_token

    render json: {msg: "good bye!"}
  end

  private
  def sign_in_params
    params.require(:session).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])

    if @user
      @user
    else
      render json: { msg: "invalid email" }, status: 404
    end
  end

  def validate_token
    @user = User.find_by_authentication_token(request.headers["AUTH-TOKEN"])

    if @user
      @user
    else
      render json: { msg: "invalid authentication token" }, status: 404
    end
  end
end
