class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :load_user, only: [:show, :edit, :update]
  before_action :admin_user

  def show
  end

  def index
    @users = User.paginate page: params[:page]
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
    @user = User.find(params[:id])
  end
  
 
  def destroy
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user.nil"
      redirect_to admin_users_path
    end
    if @user.destroy
      flash[:success] = t "user_destroy"
      redirect_to admin_users_path  
    end
  end

  def update
    if @user.update_attributes user_params  
      flash[:success] = t "user_success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "user_danger"
      render :edit
    end    
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation, :tel, :admin
  end
end
