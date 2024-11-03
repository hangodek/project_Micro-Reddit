class UserController < ApplicationController
  allow_unauthenticated_access

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_path
    else
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password)
  end
end
