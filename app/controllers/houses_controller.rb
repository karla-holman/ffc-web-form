class HousesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @houses = House.all
    else
      @houses = House.where(user: current_user)
    end
  end
end
