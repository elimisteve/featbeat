class EntriesController < ApplicationController
  before_filter :require_authentication

  def index
  end
  
  def create
    Entry.create(
      :user   => current_user,
      :count  => params[:count],
      :unit   => params[:unit],
      :noun   => params[:noun],
      :verb   => params[:verb]
    )
    
    render :json => { :status => 'success' }
  end
end
