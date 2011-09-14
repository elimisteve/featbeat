class Api::InboundEmailController < ActionController::Base
  def create
    Rails.logger.info "got #{params}"
    
    render :json => { :status => 'success' }
  end
end