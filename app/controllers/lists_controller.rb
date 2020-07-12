class ListsController < ApplicationController

  before_action :set_list, only: [:show]

  def show
  end 

  def index
    @lists = List.active 
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  #def block_params
  #  params.require(:block).permit(:name, :description, :polyline, :neighborhood_id)
  #end

end