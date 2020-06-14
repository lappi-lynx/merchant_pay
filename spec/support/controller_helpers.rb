module ControllerHelpers
  def jwt_token_for(user)
    token = JsonWebToken.encode(user_id: user.id)
    { 'Authorization': "Bearer #{token}" }
  end
end
