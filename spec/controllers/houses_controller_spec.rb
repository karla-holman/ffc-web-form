require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  let!(:admin) { Fabricate :admin_user }
  let!(:new_user) { Fabricate :user }
  let!(:houses) { Fabricate.times(3, :house) }

  describe 'index' do
    context 'as an admin user' do
      before { sign_in admin }

      it 'assigns the houses' do
        expect(subject.current_user).to_not eq(nil)

        get :index

        expect(assigns(:houses)).to eq House.all
      end
    end

    context 'as a regular user' do
      before { sign_in new_user }

      it 'assigns the houses' do
        expect(subject.current_user).to_not eq(nil)

        get :index

        expect(assigns(:houses)).to eq House.all
        expect(assigns(:houses).length).to eq 3
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
end
