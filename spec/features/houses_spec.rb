require 'rails_helper'

RSpec.feature 'House', type: :feature do
  let!(:admin) { Fabricate :admin_user }
  let!(:new_user) { Fabricate :user }
  let!(:houses) { Fabricate.times(3, :house) }
  let!(:admin_house) { Fabricate :house, user: admin }
  let!(:user_house) { Fabricate :house, user: new_user }
  let!(:user_house_units) { Fabricate.times(6, :unit, house: user_house) }
  let!(:user_house_maintenances) { Fabricate.times(3, :maintenance, house: user_house) }

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

=begin
      it 'shows the proper number of maintenances' do
        visit houses_path

        expect(page).to have_content('Properties')

        House.all.each do |house|
          expect(page).to have_css("#house-#{house.id}")

          within("#house-#{house.id}") do
            expect(page).to have_content("#{house.maintenances.length}")
          end
        end

        within("#house-#{user_house.id}") do
          expect(page).to have_content("3")
        end
      end
=end

=begin
      it 'views all the maintenances' do
        visit house_path(user_house)

        expect(page).to have_content('Maintenance')

        user_house.maintenances.each do |maintenance|
          expect(page).to have_content(maintenance.title)
        end
      end
=end

    end
  end

  describe 'Show' do
    context 'when the admin is logged in' do
      before do
        visit houses_path

        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password

        click_button 'Log in'
      end

      it 'views all the units' do
        visit house_path(user_house)

        expect(page).to have_content('Units')

        user_house.units.each do |unit|
          expect(page).to have_content(unit.name)
        end
      end

      it 'displays the notes' do
        visit house_path(user_house)
        expect(page).to have_content('Admin Notes')
        expect(page).to have_content('Service Provider Notes')
      end

      it 'can update the admin notes', js: true do
        visit house_path(admin_house)

        expect(page).to have_content(admin_house.name)

        expect(page).to have_css('.house_admin_notes')
        within('.house_admin_notes') do
          page.execute_script %Q{ $('.notes-area').data("wysihtml5").editor.setValue('test text') }
          click_button 'Update'
        end
      end
    end
  end
end
