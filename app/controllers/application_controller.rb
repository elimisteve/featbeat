class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_authentication
    redirect_to '/' unless user_signed_in?
    false
  end

  def require_admin
    unless user_signed_in? && current_user.is_admin?
      redirect_to '/' 
      return 
    end
  end
  
end
