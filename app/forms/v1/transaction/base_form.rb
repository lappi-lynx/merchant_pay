# frozen_string_literal: true

module V1
  module Transaction
    class BaseForm < ::BaseForm
      model :transaction

      property :uuid, parse: false
      property :type
      property :amount
      property :status
      property :customer_phone
      property :customer_email
      property :user_id

      validates :user_id, presence: true
      validates :uuid, presence: true
      validates :customer_email, presence: true
      validates :status, presence: true
      validates :status, inclusion: { in: ::Transaction.statuses.keys }
      validates :amount, numericality: { greater_than_or_equal_to: 0.0 }
    end
  end
end
