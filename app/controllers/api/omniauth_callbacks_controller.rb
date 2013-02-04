class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tent
    Rails.logger.info request.env["omniauth.auth"].to_json
    user = User.find_or_create_from_auth_hash(env['omniauth.auth'])
  end

  def failure
    Rails.logger.info request.env["omniauth.auth"].to_json
  end
end