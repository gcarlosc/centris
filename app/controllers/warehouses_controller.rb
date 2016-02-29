class WarehousesController < ApplicationController

  before_action :require_login

  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
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

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :address, :project_id)
  end
end
