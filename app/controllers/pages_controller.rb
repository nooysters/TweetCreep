class PagesController < ApplicationController
  
  include TwitterClient
  
  before_action :authenticate_user!
  
  def index 
    @tweets = {}
  end
  
  def update
    handle = params[:handle];
    @tweets = get_user_tweets handle
    respond_to do |format|
      format.js
    end
  end
  
  
  private
  
  def pages_params
    params.require(:handle)
  end

end 


