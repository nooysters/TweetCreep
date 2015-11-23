class TwitterService
  include TwitterClient

  def get_user_tweets(user, num=25)
    Rails.cache.fetch("#{user}/#{num}/tweets", expires_in: 5.minutes) do
      options = {count: num}
      twitter_client.user_timeline(user, options) #rescue false
    end
  end

end
