class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @spot = Spot.find(params[:spot_id])
    @cars = Car.all
  end

  def create
    booking = Booking.new(booking_params)
    booking.spot = Spot.find(params[:spot_id])
    booking.car = Car.find(params[:booking][:car_id])
    if booking.save
      redirect_to bookings_path
    end
  end

  def delete
    raise
  end

  private
  def booking_params
    params.require(:booking).permit(:duration)
  end
end
