class SkusController < ApplicationController

  before_action :require_login
  def create
    @line_item = LineItem.find params[:line_item_id]
    @sku = @line_item.skus.create(sku_params)
  # def create
  #   @line_item = LineItem.find params[:line_item_id]
  #   @sku = @line_item.skus.create(sku_params)
  #   @sku.product = @line_item.product
  #   @sku.warehouse = @line_item.movement.destinable_id
  #   redirect_to edit_line_item_path(@line_item)
  end

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
