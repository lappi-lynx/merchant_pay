FactoryBot.define do
  factory :role, aliases: [:admin_role] do
    name { ::Role::ADMIN }
  end

  factory :merchant_role, class: 'Role' do
    name { ::Role::MERCHANT }
  end
end
