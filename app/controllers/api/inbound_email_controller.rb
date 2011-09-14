class Api::InboundEmailController < ActionController::Base
  def create
    Rails.logger.info "got #{params}"
    
    e = Entry.create_from_sentence(params[:subject])
    
    if e
      result = { :status => 'success', :entry_id => e.id }
    else
      result = { :status => 'fail' }
    end
    
    render :json => result
  end
end