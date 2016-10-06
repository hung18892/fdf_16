class CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy]

  def index
    @categories = Category.recent.paginate page: params[:page],
      per_page: Settings.per_page
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
