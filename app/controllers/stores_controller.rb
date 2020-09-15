class StoresController < ApplicationController

  before_action :set_store, only: [:edit, :update, :make_current]

  def new
    @store = Store.new 
  end

  def create
    @store = Store.create(store_params)
    redirect_to stores_path
  end

  def index
    @stores = Store.all
  end

  def update
    @store.update(store_params)
    redirect_to stores_path
  end

  def edit
  end

  def make_current
    @store.make_current
    redirect_back(fallback_location: root_path)
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name)
  end

end