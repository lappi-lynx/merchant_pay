merchant = Merchant.first_or_create(
  name: Faker::Name.first_name,
  description: 'Merchant description',
  email: 'merchant@mail.com',
  total_transaction_sum: Faker::Number.decimal,
  password: 'password123'
)

Transactions::Authorize.create!(
  merchant: merchant,
  uuid: Faker::Internet::uuid,
  customer_phone: Faker::PhoneNumber.phone_number_with_country_code,
  customer_email: Faker::Internet.email,
  amount: Faker::Number.decimal,
  status: 'approved'
)

admin_role = Role.find_or_create_by(name: ::Role::MERCHANT)
merchant_role = Role.find_or_create_by(name: ::Role::ADMIN)
admin = User.first_or_create(name: 'Admin', email: 'admin@mail.com', password: 'password123', role_id: admin_role.id)
