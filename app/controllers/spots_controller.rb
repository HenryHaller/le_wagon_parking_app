class SpotsController < ApplicationController
  def index
    @spots = Spot.all
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
      redirect_to spot_path()
    else
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
