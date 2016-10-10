class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy]
  before_action :logged_in_user, :admin_user

  def index
    @categories = Category.recent.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @category = Category.new  
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create"
    else
      flash[:danger] = t "category.fail"
    end
    redirect_to categories_path 
  end

  def destroy
    unless @category.destroy
      flash[:danger] = t "category.no_destroy"
      redirect_to root_path
    else
      flash[:success] = t "category.destroy"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category.present?
      flash[:danger] = t "category.no_found"
      redirect_to root_path
    end
  end  
end
