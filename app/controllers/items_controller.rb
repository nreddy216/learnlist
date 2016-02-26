class ItemsController < ApplicationController
  #user must be logged in to create or destroy a list item
  before_action :current_user, only: [:create, :destroy]




  def create

    @item = current_user.lists.items.create(item_params)


    redirect_to current_user

  end

  #DELETE ITEM NOT WORKING
  def destroy
    @item = current_user.lists.items.find(item_params)
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to current_user
  end

  private

  def item_params
    params.require(:item).permit(:url, :description)
  end
end
