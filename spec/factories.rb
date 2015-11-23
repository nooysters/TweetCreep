# This will guess the User class
FactoryGirl.define do
  factory :search_history do
    user_id "MyString"
    twitter_handle "MyString"
  end

  factory :user do
    password = Faker::Internet.password
    email Faker::Internet.email
    password password
    password_confirmation password
  end
end