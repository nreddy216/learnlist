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

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  include SessionsHelper


end
