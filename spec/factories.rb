FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password_digest "password"
  end
end
