FactoryBot.define do
  factory :merchant do
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    total_transaction_sum { Faker::Number.number(digits: 2) }
    status { 'active' }
  end
end
