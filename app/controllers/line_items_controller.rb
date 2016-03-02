class LineItemsController < ApplicationController

  def edit
    @line_item = LineItem.find params[:id]
    @sku = @line_item.skus.build
  end

  def create
    @movement = Movement.find params[:movement_id]
    @movement_type = @movement.movement_type
    @line_item = @movement.line_items.create(line_item_params)
    @line_item.check_type
    redirect_to edit_movement_path(@movement, type: @movement_type)
  end

  def update
    @movement = Movement.find params[:movement_id]
    @movement_type = @movement.movement_type
    @line_item = LineItem.find params[:id]
    @line_item.update_attributes(line_item_params)
    redirect_to edit_movement_path(@movement, type: @movement_type)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
