FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Sclav #{n}" }
    sequence(:email) { |n| "dummy_#{n}@hawaii.com"}   
    password "foobars"
    password_confirmation "foobars"

    factory :admin do
    	admin true
    end
  end

  factory :micropost do
  	content "Lorem ipsum"
  	user
  end
end