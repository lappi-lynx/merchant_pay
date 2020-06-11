class Merchant < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  enum status: { active: 'active', inactive: 'inactive' }

  validates :name, :email, :status, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
