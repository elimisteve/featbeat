class Api::InboundEmailController < ActionController::Base
  
  # the from address is matched to the user
  # test with:
  # curl --data "from=somebody@somewhere.com&subject=1 test test run" http://local.featbeat.com:5002/api/inbound_email
  def create
    Rails.logger.info "got #{params}"
    
    user = User.where('email = ?', params[:from]).first

    if user
      Rails.logger.info "Have user #{user.id}"
      e = Entry.create_from_sentence(user, params[:subject])
      if e
        result = { :status => 'success', :entry_id => e.id }
      end
    end
    
    result = { :status => 'fail' } unless e
          
    render :json => result
  end
end