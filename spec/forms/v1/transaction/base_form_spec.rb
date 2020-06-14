require 'rails_helper'

RSpec.describe V1::Transaction::BaseForm do
  let(:new_transaction) { ::Transactions::Authorize.new }
  let(:form) { V1::Transaction::BaseForm.new(new_transaction) }
  let(:params) do
    {
      user_id: 1,
      uuid: Faker::Internet.uuid,
      customer_phone: Faker::PhoneNumber.cell_phone_in_e164,
      customer_email: Faker::Internet.email,
      amount: Faker::Number.decimal,
      status: 'approved'
    }
  end

  it 'is possible to create transaction with valid status' do
    expect(form.validate(params.merge(status: 'approved'))).to eq(true)
    expect(form.validate(params.merge(status: 'refunded'))).to eq(true)
    expect(form.validate(params.merge(status: 'reversed'))).to eq(true)
    expect(form.validate(params.merge(status: 'error'))).to eq(true)
    expect(form.errors.full_messages).to be_blank
  end

  it 'is not be possible to create transaction with invalid status' do
    expect(form.validate(params.merge(status: 'active'))).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status is not included in the list']
    )
  end

  it 'is not be possible to create transaction with blank status' do
    expect(form.validate(params.except(:status))).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status can\'t be blank', 'Status is not included in the list']
    )
  end

  it 'is not be possible to create transaction with blank customer_email' do
    expect(form.validate(params.except(:customer_email))).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Customer email can\'t be blank']
    )
  end

  it 'is not be possible to create transaction with blank uuid' do
    # We have to set uuid to nil because its prefilled by default in model
    new_transaction.uuid = nil
    expect(form.validate(params.except(:uuid))).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Uuid can\'t be blank']
    )
  end

  it 'is not be possible to create transaction with blank user_id' do
    expect(form.validate(params.except(:user_id))).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['User can\'t be blank']
    )
  end
end
