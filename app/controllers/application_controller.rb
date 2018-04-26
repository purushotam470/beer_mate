class ApplicationController < ActionController::API

  protected

  def authenticate_request
    auth_token = request.headers['Authorization']
    if auth_token
      token = JsonWebToken.decode(auth_token)
      @user = User.find_by(id: token[:user_id])
      render json: {error: "could not validate the auth token"}, status: :unauthorized if @user.nil?
    else
      render json: {eroor: "auth token is missing"}, status: :forbidden
    end
  end

  def payload user
    return nil unless user.present?
    auth_token = generate_jwt_token(user)
    {
      auth_token: auth_token,
      user: {
        id: user.id,
        first_name: user.first_name,
        email: user.email,
        user_name: user.user_name,
        gender: user.gender,
        created_at: user.created_at,
        updated_at: user.updated_at
      }
    }
  end

  def generate_jwt_token user
    JsonWebToken.encode({user_id: user.id, exp: Time.now.to_i + 2592000})
  end

end
