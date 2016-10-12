class Admin::ProductsController < ApplicationController
  before_action :load_product, except: [:create, :new, :index]
  before_action :load_category, only: [:create, :new, :edit]
  before_action :admin_user 

  def index
    @products = Product.recent.paginate page: params[:page], 
      per_page: Settings.per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "product.create"
      redirect_to admin_products_path
    else
      flash[:danger] = t "product.fail"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "product.updated"
      redirect_to admin_products_path
    else
      load_product
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "product.destroy"
      redirect_to admin_products_path
    else
      flash[:success] = t "product.no_destroy"
      render :new
    end
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

  def load_category
    @categories = Category.all
  end
end
