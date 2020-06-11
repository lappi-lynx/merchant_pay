merchant = Merchant.create!(
  name: Faker::Name.first_name,
  description: 'Merchant description',
  email: Faker::Internet.email,
  total_transaction_sum: Faker::Number.decimal
)

Transactions::Authorize.create!(
  merchant: merchant,
  uuid: Faker::Internet::uuid,
  customer_phone: Faker::PhoneNumber.phone_number_with_country_code,
  customer_email: Faker::Internet.email,
  amount: Faker::Number.decimal,
  status: 'approved'
)
