class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def admin_user
    unless current_user.admin?
        redirect_to root_path
    end
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end
  
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user.not_found"
      redirect_to root_path
    end
  end

  def correct_user
    load_user
    redirect_to root_path unless @user.is_user? current_user
  end
end
