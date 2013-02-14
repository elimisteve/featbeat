require 'tent_helper'

class EntriesController < ApplicationController
  before_filter :require_authentication

  def index
  end
  
  def create
    e = Entry.create(
      :user   => current_user,
      :count  => params[:count],
      :unit   => params[:unit],
      :noun   => params[:noun],
      :verb   => params[:verb]
    )

    TentHelper.post(current_user, e.to_sentence)
    
    render :json => { :status => 'success' }
  end
end
