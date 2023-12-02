# spec/features/payments_spec.rb
require 'rails_helper'

RSpec.feature 'Payments page', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'user views payments page' do
    visit new_group_payment_path(group)

    expect(page).to have_content('NEW PAYMENT')
  end

  scenario 'user adds a new payment' do
    visit new_group_payment_path(group)

    fill_in 'payment_name', with: 'Test payment'
    fill_in 'payment_amount', with: 100
    click_button 'SAVE'

    expect(page).to have_content('Test payment')
  end
end
