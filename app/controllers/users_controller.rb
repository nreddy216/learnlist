class UsersController < ApplicationController

  #for a new user
  def new
    @user = User.new
  end

  #main user dashboard page
  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    #defines the current user's list - only if logged in they can add/delete lists
    @list = @user.lists.new
    # render :show
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

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end


  # TEST
  #include ApplicationHelper

end
