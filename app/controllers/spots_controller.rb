class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    raise
  end

  def new
    @spot = Spot.new
  end

  def create
    raise
  end

  def edit
    raise
  end
end
