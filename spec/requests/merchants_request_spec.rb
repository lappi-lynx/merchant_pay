require 'rails_helper'

RSpec.describe 'MerchantsController', type: :request do
  let!(:merchant) { create(:merchant) }
  let(:valid_attributes) do
    { name: 'New name' }
  end
  let(:invalid_attributes) do
    { name: '' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get merchants_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get merchant_url(merchant)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_merchant_url(merchant)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Updated name' }
      end

      it 'updates the requested merchant' do
        expect { patch merchant_url(merchant), params: { merchant: new_attributes } }
          .to change { merchant.reload.name }.to('Updated name')
        expect(response).to redirect_to(merchant_url(merchant))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response (display the edit template)' do
        patch merchant_url(merchant), params: { merchant: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested merchant' do
      expect do
        delete merchant_url(merchant)
      end.to change(Merchant, :count).by(-1)
    end

    it 'redirects to the merchants list' do
      delete merchant_url(merchant)
      expect(response).to redirect_to(merchants_url)
    end
  end
end
