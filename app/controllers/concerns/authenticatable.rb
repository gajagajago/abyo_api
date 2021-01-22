module Authenticatable
  def current_user
    @current_user ||= User.find_for_database_authentication(authentication_token: request.headers['AUTH-TOKEN'])
  end
end
