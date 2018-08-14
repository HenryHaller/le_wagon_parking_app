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
    raise
  end
end
