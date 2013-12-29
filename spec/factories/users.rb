# # Read about factories at https://github.com/thoughtbot/factory_girl
# DEFAULT_PASSWORD = 'password'
# FactoryGirl.define do
#   factory :user do
#   	sequence(:email){ |n| "person_#{n}@example.com"}
#     password              DEFAULT_PASSWORD
#     password_confirmation DEFAULT_PASSWORD

#     factory :admin do
#       admin true
#     end

#   end
# end

require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'


    factory :admin do
      admin true
    end
  end
end
