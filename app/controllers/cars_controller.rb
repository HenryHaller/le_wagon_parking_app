class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    raise
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(cars_params)
    if @car.save
      redirect_to cars_path
    else
      render :new
  end

  private
  def cars_params
    params.require(:car).permit(:make, :model, :year, :license_plate)
  end


end
