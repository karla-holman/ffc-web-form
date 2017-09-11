class HousesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @houses = House.all
    else
      @houses = House.where(user: current_user)
    end
  end

  def show
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update_attributes(house_params)
      redirect_to(@house, :notice => 'Updated successfully.')
    else
      render :show
    end
  end

  private
    def house_params
      if current_user.admin?
        params.require(:house).permit(:admin_notes, :user_notes)
      else
        params.require(:house).permit(:user_notes)
      end
    end
end
