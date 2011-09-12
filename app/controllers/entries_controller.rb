class EntriesController < ApplicationController
  def index
  end
  
  def create
    Entry.create(
      :count => params[:count],
      :unit => params[:unit],
      :noun => params[:noun],
      :verb => params[:verb]
    )
    
    render :json => { :status => 'success' }
  end
end
