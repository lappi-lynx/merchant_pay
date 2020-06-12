class Transaction < ApplicationRecord
  belongs_to :merchant

  enum status: {
    approved: 'approved',
    refunded: 'refunded',
    reversed: 'reversed',
    error: 'error'
  }

  def initialize(*args)
    # Avoid to initialize parent transaction without a type
    raise "Cannot directly instantiate a #{self.class.name}" if self.class == Transaction

    super
  end
end
