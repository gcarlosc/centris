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
    
  end

  def create
    @project = Project.find(params[:warehouse][:project_id])
    @warehouse = @project.warehouses.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to new_warehouse_path
    else
      render :new
    end
  end

  def stock
    @warehouses = Warehouse.all
    add_breadcrumb "Stock Almacen", stock_warehouses_path
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :address, :project_id)
  end
end
