# spec/features/categories_spec.rb
require 'rails_helper'

RSpec.feature 'Categories page', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    end

  scenario 'user views categories page' do

    visit groups_path
    
    expect(page).to have_content('CATEGORIES')

  end

  scenario 'user adds a new category' do
  
    visit groups_path
    
    click_link 'ADD A NEW CATEGORY'
    
    expect(page).to have_content('NEW CATEGORY')

  end

end
