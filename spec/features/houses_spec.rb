require 'rails_helper'

RSpec.feature 'House', type: :feature do
  let!(:admin) { Fabricate :admin_user }
  let!(:new_user) { Fabricate :user }
  let!(:houses) { Fabricate.times(3, :house) }

  describe 'visiting the properties page' do
    context 'as a user' do
      it 'can view all properties' do
        visit houses_path

        expect(page).to have_text('Sign In')

        fill_in 'user_email', with: new_user.email
        fill_in 'user_password', with: new_user.password

        click_button 'Log in'

        expect(page).to have_text('Properties')

        houses.each do |house|
          expect(page).to have_text(house.name)
        end
      end
    end

    context 'as an admin' do
      it 'can view all properties' do
        visit houses_path

        expect(page).to have_text('Sign In')

        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password

        click_button 'Log in'

        expect(page).to have_text('Properties')

        houses.each do |house|
          expect(page).to have_text(house.name)
        end
      end
    end
  end
end
