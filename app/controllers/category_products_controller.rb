class CategoryProductsController < ApplicationController

  before_action :require_login

  def index
    @category_products = CategoryProduct.all
  end
  def new
    @category_product = CategoryProduct.new
  end

  def create
    @category_product = CategoryProduct.new(category_product_params)
    if @category_product.save
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
