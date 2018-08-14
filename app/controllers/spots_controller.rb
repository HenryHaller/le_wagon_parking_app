class SpotsController < ApplicationController
  def index
    @spots = current_user.spots
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spots_path
    else
      raise
      render :new
    end
  end

  def edit
    raise
  end

  private

  def spot_params
    params.require(:spot).permit(:site_name, :address, :description, :hourly_rate)
  end
end
