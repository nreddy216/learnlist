class ListsController < ApplicationController
  #user must be logged in to create or destroy a list item
  before_action :current_user, only: [:create, :destroy]

  def create
    @list = current_user.lists.create(list_params)

    #TESTING THIS
    # @items = current_user.lists.items.create(list_params)
    # if @list.save
    #   flash[:success] = "List created!"
    #   redirect_to current_user
    # end

    redirect_to current_user

  end

  #DELETE LIST NOT WORKING
  def destroy
    @list = current_user.lists.find(list_params)
    @list.destroy
    flash[:success] = "List deleted"
    redirect_to current_user
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
