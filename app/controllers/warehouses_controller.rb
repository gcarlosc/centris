class WarehousesController < ApplicationController
  def index
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
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
