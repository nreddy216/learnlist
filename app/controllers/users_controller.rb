class UsersController < ApplicationController

  #for a new user
  def new
    @user = User.new
  end

  #main user dashboard page
  def show
    @user = User.find(params[:id])

  end

  #sign up
  def create
    @user = User.new(user_params)
    if @user.save
      #success!
      redirect_to @user

    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
