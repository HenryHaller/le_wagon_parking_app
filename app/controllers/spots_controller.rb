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
    # get location if exists else nil. used only for sorting spots by distance
    location = Geocoder.search(location)[0]
    #get start and end time into a booking
    @booking = Booking.new(time_params)
    @searching = true

    #redirect to root if booking makes no sense
    redirect_to root_path and return if @booking.begin.to_i >= @booking.end.to_i
    @cars = current_user.cars
    @car = Car.new

    @spots = Spot.all
    #if we have a current user, reject out their spots
    @spots = @spots.reject {|spot| spot.user == current_user} if user_signed_in?
    #reject out spots that have bookings
    @spots.select! {|spot| check_availible_spot(spot, @booking) }

    # if we have a location, sort by it
    if location
      @spots.sort_by { |spot| spot.distance_from([@location.latitude, @location.longitude]) }
    end
    @markers = markers(@spots)

    render :index
  end
  # else
  #   redirect_to root_path
  # end

  private

  def check_availible_spot(spot, b1)
    answer =  spot.bookings.none? { |booking| overlaps?(b1, booking) }
    puts "#{answer} #{spot.site_name}"
    return answer
  end

  def overlaps?(b1, b2)
    b1begin = b1.begin.to_i
    b2begin = b2.begin.to_i

    b1end = b1.end.to_i
    b2end = b2.end.to_i

    return true if b1begin >= b2begin && b1begin <= b2end
    return true if b1end >= b2begin && b1end <= b2end
    return true if b1begin <= b2begin && b1end >= b2end
    return false
  end


  def time_params
    params.require(:results).permit(:begin, :end)
  end
  def markers(spots)
    spots.map { |spot|  {lat:spot.latitude,lng:spot.longitude, infoWindow: { content: render_to_string(partial: "/spots/spot_box", locals: { spot: spot }) }}}
  end



  def location
    params.require(:results).permit(:location)[:location]
  end


  def spot_params
    params.require(:spot).permit(:site_name, :address, :description, :hourly_rate)
  end
end
