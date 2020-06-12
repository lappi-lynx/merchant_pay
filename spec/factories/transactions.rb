FactoryBot.define do
  factory :transaction, aliases: [:authorized_transaction], class: Transactions::Authorize do
    association :merchant
    uuid { Faker::Internet.uuid }
    customer_phone { Faker::PhoneNumber.phone_number_with_country_code }
    customer_email { Faker::Internet.email }
    amount { Faker::Number.decimal }
    status { 'approved' }
  end

  factory :charge_transaction, class: Transactions::Charge do
    association :merchant
    amount { Faker::Number.decimal }
    uuid { Faker::Internet.uuid }
    customer_phone { Faker::PhoneNumber.phone_number_with_country_code }
    customer_email { Faker::Internet.email }
    status { 'approved' }
  end

  factory :refund_transaction, class: Transactions::Refund do
    association :merchant
    amount { Faker::Number.decimal }
    uuid { Faker::Internet.uuid }
    customer_phone { Faker::PhoneNumber.phone_number_with_country_code }
    customer_email { Faker::Internet.email }
    status { 'refunded' }
  end

  factory :reversal_transaction, class: Transactions::Reversal do
    association :merchant
    uuid { Faker::Internet.uuid }
    customer_phone { Faker::PhoneNumber.phone_number_with_country_code }
    customer_email { Faker::Internet.email }
    status { 'reversed' }
  end
end
