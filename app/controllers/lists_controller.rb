class ListsController < ApplicationController

  before_action :set_list, only: [:show, :add_item, :close, :remove_item]

  def show
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

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end