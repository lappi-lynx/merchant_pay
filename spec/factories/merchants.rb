FactoryBot.define do
  factory :merchant do
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    total_transaction_sum { Faker::Number.number(digits: 2) }
    status { 'active' }
    password { 'password123' }

    trait :with_authorize_transaction do
      before(:create) do |merchant|
        merchant.transactions << build(:authorized_transaction)
      end
    end
  end
end
