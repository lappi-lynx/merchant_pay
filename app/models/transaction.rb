class Transaction < ApplicationRecord
  belongs_to :merchant

  enum status: {
    approved: 'approved',
    refunded: 'refunded',
    reversed: 'reversed',
    error: 'error'
  }

  validates :status, inclusion: { in: statuses.keys }
  validates :uuid, :customer_email, :status, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0.0 }

  def initialize(*args)
    # Avoid to initialize parent transaction without a type
    raise "Cannot directly instantiate a #{self.class.name}" if self.class == Transaction

    super
  end
end
