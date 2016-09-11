class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now.alert = "Email or Password is invalid"
      redirect_to user_path(user)
    else
      flash.now.alert = "Email or Password is invalid"
      render :new
    end
  end
end
