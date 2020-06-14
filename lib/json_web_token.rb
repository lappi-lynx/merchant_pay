require 'jwt'

module JsonWebToken
  ALGORITHM = 'HS256'.freeze

  module_function

  def encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
  end

  def decode(token)
    HashWithIndifferentAccess.new(
      JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: ALGORITHM)[0]
    )
  rescue StandardError
    nil
  end
end
