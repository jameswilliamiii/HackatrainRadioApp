class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user
      if user.authenticate(params[:password])
        flash[:notice] = "Welcome #{user.username}!"
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:notice] = "Incorrect sign in info!"
        render 'new'
      end
    else
      flash[:notice] = "Incorrect sign in info!"
      render 'new'
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "You were sucessfully signed out"
  end
end
