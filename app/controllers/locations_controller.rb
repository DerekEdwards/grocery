class LocationsController < ApplicationController

  before_action :set_location, only: [:edit, :update]

  def new
    @location = Location.new 
  end

  def create
    @location = Location.create(location_params)
    redirect_to locations_path
  end

  def index
    @locations = Location.by_order
  end

  def update
    @location.update(location_params)
    redirect_to locations_path
  end

  def edit
  end

  private

  def set_location
    @location= Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :order)
  end

end
