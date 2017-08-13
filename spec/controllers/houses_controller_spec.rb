require 'rails_helper'

RSpec.describe HousesController, type: :controller do

  describe 'index' do
    it 'assigns the houses' do
      get :index

      expect(assigns(:houses)).to eq House.all
    end
  end
end
