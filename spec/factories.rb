FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Sclav #{n}" }
    sequence(:email) { |n| "dummy_#{n}@hawaii.com"}   
    password "foobars"
    password_confirmation "foobars"
  end
end