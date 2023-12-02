require 'rails_helper'

RSpec.feature 'Group Payments page', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'user views group payments page' do
    visit group_group_payments_path(group)

    expect(page).to have_http_status(:success)
    expect(page).to have_content('PAYMENTS')
  end

  scenario 'user adds a new payment' do
    visit group_group_payments_path(group)

    click_link 'Add new Payment'

    expect(page).to have_content('NEW PAYMENT')
  end
end
