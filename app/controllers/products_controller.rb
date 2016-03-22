class ProductsController < ApplicationController

  before_action :require_login

  add_breadcrumb "Producto", :products_path

  def index
    @products = Product.all.order(created_at: :asc)
  end

  def new
    @product = Product.new
    add_breadcrumb "Nuevo producto", new_product_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
    add_breadcrumb "Editar producto"
  end

  def update
    @product = Product.find params[:id]
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def stock
    @products = Product.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = StockProductPdf.new(@products)
        send_data pdf.render, filename: "stock_productos.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
    add_breadcrumb "Stock Almacen", stock_warehouses_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :code, :unit_id, :category_product_id, :classification_id, :description_id)
  end
end
