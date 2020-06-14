module Api
  module V1
    class TransactionsController < ::Api::BaseController
      include ActionController::MimeResponds

      def create
        transaction_form = form_class.new(resource_class.new)

        if transaction_form.validate_and_save!(transaction_params)
          render json: transaction_form.model
        else
          render json: transaction_form.errors.full_messages
        end
      end

      private

      def form_class
        # TODO: use transaction specific type form based on resource_class
        ::V1::Transaction::AuthorizeForm
      end

      def resource_class
        # TODO: map type from params to one of the following transactions:
        # Transactions::Authorize
        # Transactions::Refund
        # Transactions::Reversal
        # Transactions::Charge
        ::Transactions::Authorize
      end

      def transaction_params
        params.fetch(:transaction).permit(:user_id, :customer_phone, :customer_email, :amount, :status)
      end
    end
  end
end
