class ProductsController < ApplicationController

  before_action :require_login

  add_breadcrumb "Producto", :products_path

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    add_breadcrumb "Nuevo producto", new_product_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to new_product_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :unit_id, :category_product_id, :classification_id, :description_id)
  end
end
