require 'rails_helper'

RSpec.describe SearchHistory, type: :model do

  before :each do
    @search_history = build(:search_history)
  end

  it 'is has valid factory' do
    expect(@search_history).to be_valid
  end

  it 'is invalid if twitter_handle is not present' do
    @search_history.update({twitter_handle: nil})
    expect(@search_history).to be_invalid
  end

  it 'is invalid without a user id' do
    @search_history.update(user_id: nil)
    expect(@search_history).to be_invalid
  end

end
