class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = Product.recent.paginate page: params[:page], 
      per_page: Settings.per_page
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.recent.paginate page: params[:page],
      per_page: Settings.per_page
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :picture, :price, :species,
      :category_id
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product.present?
      flash[:danger] = t "product.no_found"
      render file: "public/404.html"
    end
  end
end
