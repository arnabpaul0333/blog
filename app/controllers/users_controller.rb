class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user) 
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id]) 
  end
  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:first_name,:email,:photo)
  end
end
