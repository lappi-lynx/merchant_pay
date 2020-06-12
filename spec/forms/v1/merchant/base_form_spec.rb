require 'rails_helper'

RSpec.describe V1::Merchant::BaseForm do
  let(:merchant) { build(:merchant) }
  let(:form) { V1::Merchant::BaseForm.new(merchant) }

  it 'is possible to create merchant with valid status' do
    expect(form.validate(status: 'active')).to eq(true)
    expect(form.validate(status: 'inactive')).to eq(true)
    expect(form.errors.full_messages).to be_blank
  end

  it 'is not be possible to create merchant with invalid status' do
    expect(form.validate(status: 'invalid')).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status is not included in the list']
    )
  end

  it 'is not be possible to create merchant with blank status' do
    expect(form.validate(status: '')).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Status can\'t be blank', 'Status is not included in the list']
    )
  end

  it 'is not be possible to create merchant with blank name' do
    expect(form.validate(name: nil)).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Name can\'t be blank']
    )
  end

  it 'is not be possible to create merchant with blank email' do
    expect(form.validate(email: nil)).to eq(false)
    expect(form.errors.full_messages).to eq(
      ['Email can\'t be blank']
    )
  end
end
