class PagesController < ApplicationController
  
  before_action :authenticate_user!, :set_twitter
  
  def index 
    @tweets = @twitter.get_user_tweets "GeorgeTakei"
    @user_history =  current_user.searches.all.take(10)
  end
  
  def update
    @handle = params[:handle];
    @tweets = @twitter.get_user_tweets @handle

    current_user.searches.create({twitter_handle: @handle})

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


