require 'rails_helper'

RSpec.describe V1::Transaction::BaseForm do
  let(:transaction) { build(:transaction) }
  let(:form) { V1::Transaction::BaseForm.new(transaction) }

  it 'is possible to create transaction with valid status' do
    expect(form.validate(status: 'approved')).to eq(true)
    expect(form.validate(status: 'refunded')).to eq(true)
    expect(form.validate(status: 'reversed')).to eq(true)
    expect(form.validate(status: 'error')).to eq(true)
    expect(form.errors.full_messages).to be_blank
  end

  it 'is not be possible to create transaction with invalid status' do
    expect(form.validate(status: 'active')).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status is not included in the list']
    )
  end

  it 'is not be possible to create transaction with blank status' do
    expect(form.validate(status: '')).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status can\'t be blank', 'Status is not included in the list']
    )
  end

  it 'is not be possible to create transaction with blank customer_email' do
    expect(form.validate(customer_email: nil)).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Customer email can\'t be blank']
    )
  end

  it 'is not be possible to create transaction with blank uuid' do
    expect(form.validate(uuid: nil)).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Uuid can\'t be blank']
    )
  end
end
