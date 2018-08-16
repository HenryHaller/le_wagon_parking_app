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
    @car = Car.new(cars_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end
  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to cars_path
  end


  private
  def cars_params
    params.require(:car).permit(:make, :model, :year, :license_plate, :photo, :photo_cache)
  end

end
