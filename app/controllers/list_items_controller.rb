class ListItemsController < ApplicationController

  before_action :set_list_item, only: [:edit, :update]

  def update
    @list_item.update(list_item_params)
    redirect_to list_path @list_item.list
  end

  def edit
  end

  private

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:note)
  end

end
