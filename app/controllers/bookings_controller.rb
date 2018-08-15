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
    @booking = Booking.new
    @spot = Spot.find(params[:spot_id])
    @cars = current_user.cars
  end

  def create
    booking = Booking.new(booking_params)
    booking.spot = Spot.find(params[:spot_id])
    booking.car = Car.find(params[:booking][:car_id])
    if booking.save
      redirect_to bookings_path
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.delete
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:duration)
  end
end
