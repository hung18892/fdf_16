class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user.nil"
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
