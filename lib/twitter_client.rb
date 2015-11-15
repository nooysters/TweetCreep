require "twitter"

module TwitterClient
  
  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
                          config.consumer_key        = ENV['CONSUMER_KEY']
                          config.consumer_secret     = ENV['CONSUMER_SECRET']
                          config.access_token        = ENV['ACCESS_TOKEN']
                          config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
                        end
  end
  
  def get_user_tweets(user, num=25)
    Rails.cache.fetch("#{user}/#{num}/tweets", expires_in: 5.minutes) do
      options = {count: num}
      begin
        response = twitter_client.user_timeline(user, options)
      rescue Twitter::Error::NotFound => error
        return false
      end
      response
    end
  end

  
end