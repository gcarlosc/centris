class WarehousesController < ApplicationController

  before_action :require_login

  add_breadcrumb "Almacen", :warehouses_path

  def index
    @warehouses = Warehouse.all.order(created_at: :asc)
  end

  def new
    @warehouse = Warehouse.new
    add_breadcrumb "Nuevo Almacen", new_warehouse_path
  end

  def skus_show
    @warehouse = Warehouse.find(params[:warehouse])
    @product = Product.find(params[:product])
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def stock
    @warehouses = Warehouse.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = StockWarehousePdf.new(@warehouses)
        send_data pdf.render, filename: "stock_almacenes.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
    add_breadcrumb "Stock Almacen", stock_warehouses_path
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :address, :project_id, :longitude, :latitude)
  end

end
