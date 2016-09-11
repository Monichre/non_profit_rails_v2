class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully Added"
      redirect_to users_path
    else
      flash[:notice] = "Something happened, Let's try that again."
      render :new
    end
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def edit
    @user = User.find(params[:id])
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to user_path(@user)
    else
      flash[:notice] = "That didn't work, let's do that again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params()
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age)
  end
end
