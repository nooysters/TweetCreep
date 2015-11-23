require 'rails_helper'

describe TwitterService, type: :model do
  describe "call get get_user_tweets" do
    it 'should get tweets' do
      @twitter_service = TwitterService.new
      VCR.use_cassette 'twitter_service/get_user_tweets' do
        response = @twitter_service.get_user_tweets('jeremy')
        response.first.class == 'Twitter::Tweet'
      end
    end
  end
end