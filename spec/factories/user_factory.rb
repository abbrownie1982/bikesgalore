FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    first_name "example"
    last_name "example"
    email
    password "example"
    admin false
  end
end