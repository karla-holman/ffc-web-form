require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User visits the home page' do
    visit '/'

    expect(page).to have_text('Welcome to FFC Web Help')
  end
end
