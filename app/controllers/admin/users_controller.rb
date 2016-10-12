class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :load_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit   
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "user_success"
      redirect_to @user
    else
      flash[:danger] = t "user_danger"
      render :edit
    end    
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :tel
  end
end
