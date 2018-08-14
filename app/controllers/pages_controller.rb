class PagesController < ApplicationController
  def home
    @current_user=current_user
    @cars = @current_user.cars
    @spots = @current_user.spots
    @bookings = @current_user.bookings
  end
end
