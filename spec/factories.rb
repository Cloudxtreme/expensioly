FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category_#{n}" }
  end

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password_digest "password"
  end
end
