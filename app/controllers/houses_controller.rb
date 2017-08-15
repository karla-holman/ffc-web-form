class HousesController < ApplicationController
  before_action :authenticate_user!

  def index
    @houses = House.all
  end
end
