class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_user
  

  def find_user
    @user = User.find_by_id(session[:user_id]) if not session[:user_id].nil?
  end

  def require_login
    if @user.blank?
      redirect_to new_session_path, notice: "You must be logged in!"
    end
  end
  
end
