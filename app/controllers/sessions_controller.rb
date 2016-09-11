class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    non_profit = NonProfit.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now.alert = "#{user.name} Logged In!"
      redirect_to user_path(user)
    elsif non_profit && non_profit.authenticate(params[:password])
      session[:non_profit_id] = non_profit.id
      flash.now.alert = "#{non_profit.name} Logged In!"
      redirect_to non_profit_path(non_profit)
    else
      flash.now.alert = "Email or Password is invalid"
      render :new
    end
  end
end
