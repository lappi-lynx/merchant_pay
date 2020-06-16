require 'rails_helper'

describe 'Signin process', type: :feature do
  let!(:admin) { create(:user, email: 'admin@mail.com', password: 'password', role: create(:admin_role)) }
  let!(:merchant) { create(:merchant, email: 'merchant@mail.com', password: 'password', role: create(:merchant_role)) }

  feature 'Signing in as admin' do
    scenario 'with correct credentials' do
      sign_in(admin)
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'with invalid credentials' do
      sign_in(User.new(email: 'admin@mail.com', password: '123123'))
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  feature 'Signing in as merchant' do
    scenario 'with correct credentials' do
      sign_in(merchant)
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'with invalid credentials' do
      sign_in(User.new(email: 'merchant@mail.com', password: '123123'))
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
