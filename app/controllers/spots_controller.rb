class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spots = current_user.spots
    @markers = markers(@spots)
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

  def destroy
    spot = Spot.find(params[:id])
    spot.delete
    redirect_to spots_path
  end

  def results
    @spots = Spot.where.not(user: current_user)
    @searching = true
    render :index
  end
  private
  def markers(spots)
    spots.map { |spot|  {lat:spot.latitude,lng:spot.longitude}}
  end


  def spot_params
    params.require(:spot).permit(:site_name, :address, :description, :hourly_rate)
  end
end
