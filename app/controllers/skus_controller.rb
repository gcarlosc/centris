class SkusController < ApplicationController

  before_action :require_login
  before_action :set_movement, only: [:update_warehouse, :return_products]

  def update_warehouse
    return redirect_to root_path unless @movement.pending?
    @movement.sku_ids = params[:sku_ids]
    @movement.change_warehouse
    @movement.saved!
    flash[:notice] = "Se guardo satisfactoriamente"
    redirect_to root_path
  end

  def return_products
    return redirect_to root_path unless @movement.pending?
    @movement.sku_ids = params[:sku_ids]
    Sku.where(id: params[:sku_ids]).update_all(status: 'inactive')
    @movement.saved!
    flash[:notice] = "Se guardo satisfactoriamente"
    redirect_to root_path
  end

  private

  def sku_params
    params.require(:sku).permit(:sku, :status, :product_id, :warehouse_id, :line_item_id)
  end

  def set_movement
    @movement = Movement.find params[:movement_id]
  end
end
