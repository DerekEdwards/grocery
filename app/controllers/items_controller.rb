class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :deactivate]

  def new
    @item = Item.new 
    @locations = Location.by_order.map{ |x| ["#{x.name}: #{x.description}", x.id] }
    @locations = [['Unknown', nil]] + @locations
    @placeholder = allowed_params[:placeholder]
    @list_id = allowed_params[:list_id]    
  end

  def create
    @item = Item.new
    @item.name = item_params[:name]
    unless item_params[:location].blank?
      @item.location = Location.find(item_params[:location])
    end
    @item.save
    
    list_id = allowed_params[:list_id]
    if list_id 
      list = List.find(list_id)
      list.add_item @item
      redirect_to list_path(list_id)
    else
      redirect_to items_path
    end
  end

  def index
    @items = Item.active
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
    @locations = Location.by_order.map{ |x| ["#{x.name}: #{x.description}", x.id] }
    @locations = [['Unknown', nil]] + @locations
  end

  def search
    search_string = allowed_params[:search_string]
    response = Item.search search_string
    render json: response
  end

  def deactivate
    @item.active = false
    @item.save
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :location, :list)
  end

  def allowed_params
    params.permit(:search_string, :placeholder, :list_id)
  end

end
