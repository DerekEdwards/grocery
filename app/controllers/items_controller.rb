class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update]

  def new
    @item = Item.new 
    @locations = Location.all.map{ |x| [x.name, x.id] }
    @locations = [['Unknown', nil]] + @locations
  end

  def create
    @item = Item.new
    @item.name = item_params[:name]
    unless item_params[:location].blank?
      @item.location = Location.find(item_params[:location])
    end
    @item.save
    redirect_to items_path
  end

  def index
  end

  def update
    @item.name = item_params[:name]
    unless item_params[:location].blank?
      @item.location = Location.find(item_params[:location])
    end
    @item.save
    redirect_to items_path
  end


  def edit
    @locations = Location.all.map{ |x| [x.name, x.id] }
    @locations = [['Unknown', nil]] + @locations
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :location, :list)
  end

end