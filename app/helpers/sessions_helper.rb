module SessionsHelper

  #logs user in by setting the session ID to the user.id
  #sets the current user as the user in the argument
  def login(user)
    session[:user_id] = user.id
    # @current_user = user
    @current_user = current_user
  end

  #FIND OUT MORE ABOUT THIS
  #returns the current user or sets current user to the one
  # found through the session user id
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  #redirects to sign in page if there is no current user
  def logged_in?
    if current_user == nil
      redirect_to "/sign_in"
    end
  end

  #logs user out by setting the current user to nil
  def logout
    @current_user = session[:user_id] = nil
  end
end
