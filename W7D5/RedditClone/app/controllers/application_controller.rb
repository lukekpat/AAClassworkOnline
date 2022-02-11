class ApplicationController < ActionController::Base
  helper_method :require_logged_in, :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url if !logged_in?
  end

  def require_logged_out
    redirect_to user_url(current_user) if logged_in?
  end

  def login(user)
    @current_user = user 
    session[:session_token] = user.reset_session_token!
  end

  def logout
    @current_user.reset_session_token!
    @current_user = nil 
    session[:session_token] = nil 
  end

  def logged_in?
    !!current_user
  end 

end
