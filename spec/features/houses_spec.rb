require 'rails_helper'

RSpec.feature 'House', type: :feature do
  let!(:admin) { Fabricate :admin_user }
  let!(:new_user) { Fabricate :user }
  let!(:houses) { Fabricate.times(3, :house) }
  let!(:admin_house) { Fabricate :house, user: admin }
  let!(:user_house) { Fabricate :house, user: new_user }
  let!(:user_house_units) { Fabricate.times(6, :unit, house: user_house) }

  describe 'visiting the properties page' do
    context 'as a user' do
      it 'can view all properties that belong to them' do
        visit houses_path

        expect(page).to have_text('Sign In')

        fill_in 'user_email', with: new_user.email
        fill_in 'user_password', with: new_user.password

        click_button 'Log in'

        expect(page).to have_text('Properties')
        expect(page).to have_link('Properties')


        expect(page).to_not have_text(admin_house.name)
        expect(page).to have_text(user_house.name)
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
        expect(page).to have_link('Properties')

        House.all.each do |house|
          expect(page).to have_text(house.name)
        end
      end
    end

    context 'when not logged in' do
      it 'cannot access the properties page' do
        visit root_path

        expect(page).to_not have_link('Properties')
      end
    end
  end

  describe 'house details' do
    context 'when the admin is logged in' do
      before do
        visit houses_path

        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password

        click_button 'Log in'
      end

      it 'shows the proper number of units' do
        visit houses_path

        expect(page).to have_content('Properties')

        House.all.each do |house|
          expect(page).to have_css("#house-#{house.id}")

          within("#house-#{house.id}") do
            expect(page).to have_content("#{house.units.length}")
          end
        end

        within("#house-#{user_house.id}") do
          expect(page).to have_content("6")
        end
      end
    end
  end
end
