class ItemLocationsController < ApplicationController

  def create
    @item_location = ItemLocation.new 
    @item_location.update(item_location_params)
    redirect_to edit_item_path @item_location.item
  end

  def new
    @item = Item.find(item_params[:item_id])
    @item_location = ItemLocation.new 
    @item_location.item = @item
  end

  def destroy
    @item_location = ItemLocation.find(params[:id])
    @item = @item_location.item 
    @item_location.delete
    redirect_to edit_item_path @item
  end

  private

  def item_params
    params.permit(:item_id)
  end

  def item_location_params
    params.require(:item_location).permit(:location_id, :item_id)
  end

end
