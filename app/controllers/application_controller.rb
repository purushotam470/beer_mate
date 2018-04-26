class ApplicationController < ActionController::API
  def authenticate_request
    auth_token = request.headers['Authorization']
    if auth_token
      token = JsonWebToken.decode(auth_token)
      @user = User.find_by(id: token[:employee_id])
      render json: {error: "could not validate the auth token"}, status: :unauthorized if @employee.nil?
    else
      render json: {eroor: "auth token is missing"}, status: :forbidden
    end
  end

  protected

  def payload user
    return nil unless user.present?
    auth_token = generate_jwt_token(employee)
    {
      auth_token: auth_token,
      employee: {
        id: user.id,
        first_name: user.first_name,
        email: user.email,
        user_name: user.user_name,
        gender: user.gender,
        created_at: employee.created_at,
        updated_at: employee.updated_at
      }
    }
  end

  def generate_jwt_token user
    JsonWebToken.encode({employee_id: employee.id, exp: Time.now.to_i + 2592000})
  end

end
