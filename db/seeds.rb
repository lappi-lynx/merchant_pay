merchant = Merchant.where(
  name: Faker::Name.first_name,
  description: 'Merchant description',
  email: 'merchant@mail.com',
  total_transaction_sum: Faker::Number.decimal
).first_or_create { |m| m.password = 'password123' }

Transactions::Authorize.create!(
  merchant: merchant,
  uuid: Faker::Internet::uuid,
  customer_phone: Faker::PhoneNumber.phone_number_with_country_code,
  customer_email: Faker::Internet.email,
  amount: Faker::Number.decimal,
  status: 'approved'
)

admin_role = Role.find_or_create_by(name: ::Role::ADMIN)
merchant_role = Role.find_or_create_by(name: ::Role::MERCHANT)
admin = User.where(name: 'Admin', email: 'admin@mail.com', role_id: admin_role.id).first_or_create do |u|
  u.password = 'password123'
end
