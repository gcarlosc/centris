class SkusController < ApplicationController

  before_action :require_login

  # def update
  #   @line_item = LineItem.find params[:line_item_id]
  #   @sku = Sku.find params[:id]
  #   @sku.update_attributes(sku_params)
  #   flash[:notice] = "Se guardo satisfactoriamente"
  #   redirect_to edit_line_item_path(@line_item)
  # end

  def update_warehouse
    @movement = Movement.find params[:movement_id]
    Sku.where(id: params[:sku_ids]).update_all(warehouse_id: @movement.destinable_id)
    @movement.saved!
    @movement.add_skus(params[:sku_ids])
    redirect_to root_path, notice: "Se guardo satisfactoriamente"
  end

  def return_products
    @movement = Movement.find params[:movement_id]
    Sku.where(id: params[:sku_ids]).update_all(status: 'inactive')
    @movement.saved!
    @movement.add_skus(params[:sku_ids])
    redirect_to root_path, notice: "Se guardo satisfactoriamente"
  end


  private

  def sku_params
    params.require(:sku).permit(:sku, :status, :product_id, :warehouse_id, :line_item_id)
  end
end
