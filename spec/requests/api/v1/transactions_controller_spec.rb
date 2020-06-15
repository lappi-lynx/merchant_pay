require 'rails_helper'

RSpec.describe 'TransactionsController', type: :request do
  let!(:admin)    { create(:user) }
  let!(:merchant) { create(:merchant) }
  let(:valid_attributes) do
    {
      type: 'authorize',
      user_id: merchant.id,
      customer_phone: Faker::PhoneNumber.cell_phone_in_e164,
      customer_email: Faker::Internet.email,
      amount: Faker::Number.decimal,
      status: 'approved'
    }
  end
  let(:invalid_attributes) do
    valid_attributes.except(:user_id)
  end

  describe 'POST /create' do
    context 'in JSON format' do
      let(:headers) do
        { 'CONTENT_TYPE' => 'application/json' }.merge(jwt_token_for(admin))
      end

      subject do
        post api_v1_transactions_url,
             params: { transaction: attributes }.to_json,
             headers: headers
      end

      context 'with valid parameters' do
        let(:attributes) { valid_attributes }

        it 'create the requested transaction' do
          expect { subject }
            .to change { Transaction.count }.by(1)
          expect(JSON.parse(response.body)).to eq(Transaction.last.as_json)
        end
      end

      context 'with invalid parameters' do
        let(:attributes) { invalid_attributes }

        it 'does not create the requested transaction' do
          expect { subject }
            .not_to change { Transaction.count }
          expect(JSON.parse(response.body)).to eq(["User can't be blank"])
        end
      end
    end

    context 'in XML format' do
      let(:headers) do
        { 'CONTENT_TYPE' => 'application/xml' }.merge(jwt_token_for(admin))
      end

      context 'with valid parameters' do
        subject do
          post api_v1_transactions_url,
               params: { transaction: valid_attributes },
               headers: headers
        end

        xit 'create the requested transaction' do
        end
      end

      context 'with invalid parameters' do
        xit 'does not create the requested transaction' do
        end
      end
    end
  end
end
