class Merchant < ApplicationRecord
  validates :name, :email, :status, presence: true

  enum status: { active: 'active', inactive: 'inactive' }
  validates :status, inclusion: { in: statuses.keys }
end
