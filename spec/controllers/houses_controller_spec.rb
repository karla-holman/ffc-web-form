require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  let!(:admin) { Fabricate :admin_user }
  let!(:new_user) { Fabricate :user }
  let!(:houses) { Fabricate.times(3, :house) }
  let!(:admin_house) { Fabricate :house, user: admin }
  let!(:user_house) { Fabricate :house, user: new_user }
  let!(:user_house_units) { Fabricate.times(6, :unit, house: user_house) }

  describe 'index' do
    context 'as an admin user' do
      before { sign_in admin }

      it 'assigns the houses' do
        expect(subject.current_user).to_not eq(nil)

        get :index

        expect(assigns(:houses)).to eq House.all
        expect(assigns(:houses).length).to eq 5
      end
    end

    context 'as a regular user' do
      before { sign_in new_user }

      it 'assigns the houses' do
        expect(subject.current_user).to_not eq(nil)

        get :index

        expect(assigns(:houses)).to include user_house
        expect(assigns(:houses).length).to eq 1
        expect(assigns(:houses)).to_not include admin_house
      end
    end

    context 'when not logged in' do
      it 'does not assign the houses' do
        expect(subject.current_user).to eq(nil)

        get :index

        expect(assigns(:houses)).to eq(nil)
      end
    end
  end

  describe 'show' do
    context 'as an admin user' do
      before { sign_in admin }

      it 'assigns the houses' do
        expect(subject.current_user).to_not eq(nil)

        get :show, { id: user_house.id }

        expect(assigns(:house)).to eq user_house
        expect(assigns(:house).units.length).to eq 6
      end
    end
  end
end
