class CarsController < ApplicationController
  def index
    @cars = current_user.cars
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  private
  def cars_param
    params.require(:car).permit(:make, :model, :year, :license_plate, :photo)
  end

end
