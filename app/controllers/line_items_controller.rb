class LineItemsController < ApplicationController

  def create
    @movement = Movement.find params[:movement_id]
    @movement_type = @movement.movement_type
    @line_item = @movement.line_items.create(line_item_params)
    redirect_to edit_movement_path(@movement, type: @movement_type)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
