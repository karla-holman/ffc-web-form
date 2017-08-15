require 'rails_helper'

RSpec.feature 'Admin Panel', type: :feature do
  let!(:admin) { Fabricate :admin_user }
  let!(:user) { Fabricate :user }

  scenario 'Admin visits the admin page' do
    visit rails_admin_path
    expect(page).to have_text('Sign In')

    fill_in 'user_email', with: admin.email
    fill_in 'user_password', with: admin.password

    click_button 'Log in'

    expect(page).to have_text('Site Administration')
  end

  scenario 'User visits the admin page' do
    visit rails_admin_path
    expect(page).to have_text('Sign In')

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Log in'

    expect(page).to_not have_text('Site Administration')
    expect(page).to have_text('You are not authorized to access this page.')
  end
end
