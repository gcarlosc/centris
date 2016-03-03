class SkusController < ApplicationController

  before_action :require_login

  def edit
    @sku= Sku.find params[:id]
  end

  def update
    @line_item = LineItem.find params[:line_item_id]
    @sku = Sku.find params[:id]
    @sku.update_attributes(sku_params)
    flash[:notice] = "Se guardo satisfactoriamente"
    redirect_to edit_line_item_path(@line_item)
  end

  private

  def sku_params
    params.require(:sku).permit(:sku, :status, :product_id, :warehouse_id, :line_item_id)
  end
end
