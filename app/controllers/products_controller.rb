class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = t "product.no_found"
      redirect_to root_path
    end  
  end

  def index
    @products = Product.recent.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "product.create"
      redirect_to products_path
    else
      flash[:danger] = t "product.fail"
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :picture, :price, :species,
      :category_id
  end
end
