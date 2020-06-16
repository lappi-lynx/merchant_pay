require 'rails_helper'

describe 'After signin process', type: :feature do
  let!(:admin) { create(:user, email: 'admin@mail.com', password: 'password', role: create(:admin_role)) }
  let!(:merchant) do
    create(
      :merchant,
      :with_authorize_transaction,
      email: 'merchant@mail.com',
      password: 'password',
      role: create(:merchant_role)
    )
  end

  feature 'Admin can see and edit merchants' do
    background do
      sign_in(admin)
    end

    scenario 'Root path after sign' do
      expect(page).to have_current_path(merchants_path)
      expect(page).to have_content 'Merchants list'
      expect(page).to have_content merchant.name
      expect(page).to have_content merchant.email
      expect(page).to have_content merchant.status

      # Check merchant show page
      visit merchant_path(merchant)
      transaction = merchant.transactions.first

      expect(page).to have_content merchant.name
      expect(page).to have_content merchant.description
      expect(page).to have_content merchant.email
      expect(page).to have_content merchant.status

      expect(page).to have_content transaction.type
      expect(page).to have_content transaction.uuid
      expect(page).to have_content transaction.amount
      expect(page).to have_content transaction.status
      expect(page).to have_content transaction.customer_email
      expect(page).to have_content transaction.customer_phone

      # Update merchant via form
      visit edit_merchant_path(merchant)

      fill_in 'merchant_name', with: ''
      click_button 'Update Merchant'

      expect(page).to have_content 'Name can\'t be blank'

      fill_in 'merchant_name', with: 'New name'
      click_button 'Update Merchant'

      expect(page).to have_content 'Merchant was successfully updated.'
      expect(page).to have_current_path(merchant_path(merchant))
    end
  end

  feature 'Merchant can see and edit only themself' do
    background do
      sign_in(merchant)
    end

    scenario 'Root path after sign in' do
      transaction = merchant.transactions.first

      expect(page).to have_current_path(merchant_path(merchant))

      expect(page).to have_content "#{merchant.name} details"
      expect(page).to have_content merchant.name
      expect(page).to have_content merchant.description
      expect(page).to have_content merchant.email
      expect(page).to have_content merchant.status

      expect(page).to have_content transaction.type
      expect(page).to have_content transaction.uuid
      expect(page).to have_content transaction.amount
      expect(page).to have_content transaction.status
      expect(page).to have_content transaction.customer_email
      expect(page).to have_content transaction.customer_phone

      # Not authorized to see merchants list
      visit merchants_path
      expect(page).to have_current_path(merchant_path(merchant))
      expect(page).to have_content 'You are not authorized to access this page.'

      # Update merchant via form
      visit edit_merchant_path(merchant)

      fill_in 'merchant_name', with: ''
      click_button 'Update Merchant'

      expect(page).to have_content 'Name can\'t be blank'

      fill_in 'merchant_name', with: 'New name'
      click_button 'Update Merchant'

      expect(page).to have_content 'Merchant was successfully updated.'
      expect(page).to have_current_path(merchant_path(merchant))
    end
  end
end
