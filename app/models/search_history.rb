class SearchHistory < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :twitter_handle, :user_id
  validates_associated :user

end
