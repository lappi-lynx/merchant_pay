class Merchant < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  enum status: { active: 'active', inactive: 'inactive' }
end
