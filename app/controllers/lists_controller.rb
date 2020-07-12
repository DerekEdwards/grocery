class ListsController < ApplicationController

  before_action :set_list, only: [:show]

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

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end