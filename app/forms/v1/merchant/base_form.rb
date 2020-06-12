# frozen_string_literal: true

module V1
  module Merchant
    class BaseForm < ::BaseForm
      property :name
      property :description
      property :email
      property :status
      property :total_transaction_sum

      validates :name, presence: true
      validates :email, presence: true
      validates :status, presence: true
      validates :status, inclusion: { in: ::Merchant.statuses.keys }

      model :merchant
    end
  end
end
