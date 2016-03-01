class SkusController < ApplicationController

  before_action :require_login

  def create
    @line_item = LineItem.find params[:line_item_id]
    @sku = @line_item.skus.create(sku_params)
    redirect edit_line_item_path(@line_item)
  end

  def update
    @line_item = LineItem.find params[:line_item_id]
    @sku = Sku.find params[:id]
    @sku.update_attributes(sku_params)
    redirect_to edit_line_item_path(@line_item)
  end

  private

  def skus_params
    params.require(:sku).permit(:sku, :status, :product_id, :warehouse_id, :line_item_id)
  end
end
