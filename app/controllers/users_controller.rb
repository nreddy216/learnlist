class UsersController < ApplicationController

  #for a new user
  def new
    @user = User.new
  end

  #main user dashboard page
  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    @items = @user.items

    #FOR CLICK JQUERY THING
    # @items = Item.all
    # @lists = List.all

    #defines the current user's list - only if logged in they can add/delete lists
    @list = @user.lists.new
    @item = @user.items.new

    render :show
  end

  #sign up
  def create
    @user = User.new(user_params)

    #temporary fix to the first name can't be blank notification error
    # @user.first_name = params[:first_name] || "Learner"

    if @user.save
      #success!
      redirect_to @user

    else
      render :new
    end
  end

  def destroy

  end

  def from_category

    @selected = Item.where(list_id: params[:list_id])
    respond_to do |format|
      format.js
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end



  # TEST
  #include ApplicationHelper

end
