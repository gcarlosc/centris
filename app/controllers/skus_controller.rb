class SkusController < ApplicationController

  before_action :require_login

  def create
    @line_item = LineItem.find params[:line_item_id]
    @sku = @line_item.skus.create(sku_params)
  end

  def update
    @line_item = LineItem.find params[:line_item_id]
    @sku = Sku.find params[:id]
    @sku.update_attributes(sku_params)
  end

  private

  def sku_params
    params.require(:sku).permit(:sku, :status, :product_id, :warehouse_id, :line_item_id)
  end
end
