class Transaction < ApplicationRecord
  self.abstract_class = true
  belongs_to :merchant

  enum status: {
    approved: 'approved',
    refunded: 'refunded',
    reversed: 'reversed',
    error: 'error'
  }
end
