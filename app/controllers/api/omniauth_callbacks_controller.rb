class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tent
    Rails.logger.info request.env["omniauth.auth"].to_json
    @user = User.find_or_create_from_auth_hash(env['omniauth.auth'])

    if @user.persisted?
      sign_in @user
    end

    redirect_to '/'
  end

  def failure
    Rails.logger.info request.env["omniauth.auth"].to_json
  end
end