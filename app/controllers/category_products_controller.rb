class CategoryProductsController < ApplicationController

  before_action :require_login

  add_breadcrumb "Categoria Producto", :category_products_path

  def index
    @category_products = CategoryProduct.all
  end

  def new
    @category_product = CategoryProduct.new
    add_breadcrumb "Nueva Categoria de producto", new_category_product_path
  end

  def create
    @category_product = CategoryProduct.new(category_product_params)
    if @category_product.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to new_category_product_path
    else
      render :new
    end
  end

  private

  def category_product_params
    params.require(:category_product).permit(:name, :ancestry)
  end
end
