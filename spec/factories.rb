# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { "jazzari@att.net" }
    password "password"
    password_confirmation "password"
  end
end