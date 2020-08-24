class StoresController < ApplicationController

  before_action :set_store, only: [:edit, :update]

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

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name)
  end

end