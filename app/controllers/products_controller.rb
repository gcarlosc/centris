class ProductsController < ApplicationController

  before_action :require_login

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = t('.message')
      redirect_to new_product_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :unit_id, :category_product_id, :classification_id)
  end
end
