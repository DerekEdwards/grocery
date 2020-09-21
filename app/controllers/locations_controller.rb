class LocationsController < ApplicationController

  before_action :set_location, only: [:edit, :update]

  def new
    @stores = Store.all
    @location = Location.new 
  end

  def create
    @location = Location.create(location_params)
    redirect_to locations_path
  end

  def index
    @locations = @current_store.locations.by_order
  end

  def update
    @location.update(location_params)
    redirect_to locations_path
  end

  def edit
    @stores = Store.all
  end

  private

  def set_location
    @location= Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :order, :store_id)
  end

end
