FactoryBot.define do
  factory :user do
    association :role
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    total_transaction_sum { Faker::Number.number(digits: 2) }
    status { 'active' }
    password { 'password123' }
  end
end
