require 'rails_helper'

RSpec.feature 'Page', type: :feature do
  let!(:my_page) { Fabricate :page }
  let!(:attachment) { Fabricate :attachment, attachable: my_page }

  scenario 'User visits the page' do
    visit page_path(my_page.id)

    expect(page).to have_text(my_page.name)
  end
end
