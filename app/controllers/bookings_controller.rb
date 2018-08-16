class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @car_bookings = []
    @spot_bookings = []
    current_user.cars.each do |car|
      car.bookings.each do |booking|
        @car_bookings << booking
      end
    end
    current_user.spots.each do |spot|
      spot.bookings.each do |booking|
        @spot_bookings << booking
      end
    end
  end

  def new
    @car = Car.new
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new
    @cars = current_user.cars
  end

  def create
    booking = Booking.new(booking_params)
    booking.spot = Spot.find(params[:spot_id])
    #  unless booking.car
    unless booking.car
      @car = Car.new(car_params)
      @car.user = current_user
      booking.car = @car
    end
    if booking.save
      redirect_to bookings_path
    else
      @spot = Spot.find(params[:spot_id])
      @cars = current_user.cars
      @booking = booking
      render :new
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.delete
    redirect_to bookings_path
  end

  private
  def car_params
    params.require(:booking).require(:car).permit(:make, :model, :year, :license_plate, :photo, :photo_cache)
  end

  def booking_params
    params.require(:booking).permit(:begin, :end, :car_id)
  end
end
