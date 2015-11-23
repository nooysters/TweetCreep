require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = create(:user)
  end

  it "has valid factory" do
    expect(@user).to be_valid
  end

  it "is invalid with out email" do
    @user.update(email: nil)
    expect(@user).to be_invalid
  end

  it "can have many associated searches" do
    5.times do
     @user.searches << build(:search_history)
    end

    expect(@user.searches.length).to eq 5
  end

end
