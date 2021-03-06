class ApplicationController < ActionController::Base
  private

  def logged_in?
    return session[:user_id] != nil
  end
  def current_user
    if logged_in?
      return User.find(session[:user_id])
    end
    nil
  end

  helper_method :current_user
  helper_method :logged_in?
  
end
