class PagesController < ApplicationController
  
  before_action :authenticate_user!, :set_twitter
  
  def index 
    @tweets = @twitter.get_user_tweets "GeorgeTakei"
  end
  
  def update
    @handle = params[:handle];
    @tweets = @twitter.get_user_tweets @handle
   
    respond_to do |format|
      format.js
    end
  end
  
  
  private
  
  def pages_params
    params.require(:handle)
  end
  
  def set_twitter
    @twitter = TwitterService.new
  end

end 


