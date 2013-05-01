FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "frankthetank#{n}" }
    sequence(:email) { |n| "frank#{n}@thetank.com" }
    password 'password'
  end
end