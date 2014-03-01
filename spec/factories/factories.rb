FactoryGirl.define do
	factory :issue do
    sequence(:title) { |n| "title#{n}" }
    sequence(:description) { |n| "description#{n}" }
	end

  factory :invalid_issue do
    title nil
    description nil
  end

  factory :like do
    issue
    user
  end

  factory :comment do
    user
    body "MyText"
    issue
  end

  factory :user do
    sequence(:username) { |n| "username#{n}" }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end
end
