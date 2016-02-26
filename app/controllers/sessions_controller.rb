class SessionsController < ApplicationController

  #sign in action for route sign_in
  def new
    @user = User.new
  end

  #anytime someone is a confirmed user and has signed in / signed up
  #it will redirect them to their user page
  #otherwise they will be redirected to the sign in
  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      #flash now specifically designed for displaying flash messages on
      #rendered pages
      # flash.now[:danger] = 'Invalid email/password combination!'
      redirect_to '/'
    end
  end

  def destroy
    logout
    redirect_to '/'
  end

end
