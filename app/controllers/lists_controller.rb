class ListsController < ApplicationController

  before_action :set_list, only: [:show, :update, :print_view, :add_item, :close, :remove_item]

  def show
    @top_10 = Item.topX(10)
    @items = Item.active

    build_up_item_lists

  end 

  def print_view
    build_up_item_lists
  end

  def index
    @lists = List.active 
  end

  def new
    @list = List.new 
  end

  def create
    @list = List.create(list_params)
    redirect_to list_path @list
  end

  def update
    @list.update!(list_params)
    redirect_to list_path @list
  end

  def add_item
    @list.add_item Item.find(params[:item])
    redirect_to list_path @list
  end

  def close
    @list.active = false
    @list.save
    redirect_to root_path
  end

  def remove_item
    item = Item.find(params[:item_id])
    @list.items.delete(item)
    redirect_to list_path @list
  end

  private

  def build_up_item_lists
    @items_without_locs = @list.list_items
    @items_at_locs  = []
    @list.store.locations.by_order.each do |loc|
      items_here = []
      @list.item_locations.at_location(loc).each do |item_location|
        item_here = ListItem.find_by(item: item_location.item, list: @list)
        items_here << item_here 
        @items_without_locs -= [item_here]
      end
      unless items_here.empty?
        @items_at_locs << {location: loc, list_items: items_here}
      end
    end 
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :store_id)
  end

end