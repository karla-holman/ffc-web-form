require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let!(:page) { Fabricate :page }

  describe 'show' do
    it 'assigns the page' do
      get :show, { id: page.id }

      expect(assigns(:page)).to eq page
    end
  end
end
