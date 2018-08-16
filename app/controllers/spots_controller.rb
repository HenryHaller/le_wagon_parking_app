class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :results]
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
    input_params = time_params
    location = Geocoder.search(input_params[:location])[0]
    if location
      if current_user
        @spots = Spot.where.not(user: current_user)
      else
        @spots = Spot.all
      end
      @spots.sort_by { |spot| spot.distance_from([location.latitude, location.longitude]) }
      @markers = markers(@spots)
      @searching = true
      render :index
    else
      redirect_to root_path
    end
  end
  private
  def markers(spots)
    spots.map { |spot|  {lat:spot.latitude,lng:spot.longitude, infoWindow: { content: render_to_string(partial: "/spots/spot_box", locals: { spot: spot }) }}}

  end

  def time_params
    params.require(:results).permit(:start, :end, :location)
  end


  def spot_params
    params.require(:spot).permit(:site_name, :address, :description, :hourly_rate)
  end
end
