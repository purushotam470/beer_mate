class JsonWebToken

  def initialize
    @jwt_token =  ENV["JWT_TOEKN"]
  end


  def self.encode(payload)
    self.new
    JWT.encode(payload, @jwt_token)
  end

  def self.decode(token)
    self.initialize
    return HashWithIndifferentAccess.new(JWT.decode(token, @jwt_token, false)[0])
  rescue StandardError => e
    e.message
    nil
  end
end
