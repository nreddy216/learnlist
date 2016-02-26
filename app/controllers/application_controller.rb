class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signin
    respond_to do |format|
      format.html
      format.js
    end
  end

  #form for issue
  def home
    @home_page = true
    @user = User.new
  end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  # # makes sure that user is logged in
    # def logged_in_user
    #   unless logged_in?
    #     #store_location #look into this - how does it store location?
    #     flash[:danger] = "Please log in."
    #     redirect_to '/'
    #   end
    # end

  include SessionsHelper


end
