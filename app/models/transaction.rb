class Transaction < ApplicationRecord
  belongs_to :merchant, foreign_key: 'user_id'
  after_initialize :defaults

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

  protected

  def defaults
    return if persisted?

    self.uuid ||= SecureRandom.uuid
  end
end
