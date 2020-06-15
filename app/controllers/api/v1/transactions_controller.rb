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
        "::V1::Transaction::#{transaction_type}Form".constantize
      end

      def resource_class
        "::Transactions::#{transaction_type}".constantize
      end

      def transaction_type
        transaction_params[:type].capitalize
      end

      def transaction_params
        # allowed types: authorize, refund, reversal, charge
        params.fetch(:transaction).permit(:type, :user_id, :customer_phone, :customer_email, :amount, :status)
      end
    end
  end
end
