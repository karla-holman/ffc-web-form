require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User visits the home page' do
    visit '/'

    expect(page).to have_text('Welcome to FFC Web Help')
  end

  describe 'navigation' do
    let!(:pages) { Fabricate.times(3, :page) }

    scenario 'it displays the pages in the navigation with a link to that page' do
      visit '/'

      Page.all.each do |page_link|
        expect(page).to have_content(page_link.name)
        expect(page).to have_selector(:css, "a[href='#{page_path(page_link)}']")
      end
    end
  end
end
