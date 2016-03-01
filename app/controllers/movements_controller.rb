class MovementsController < ApplicationController

  before_action :require_login

  before_action :set_movement, only: [:edit, :update]
  before_action :set_movement_type, only: [:new, :create]

  def index
    @movements = Movement.all
  end

  def new
    @movement = current_user.movements.new
  end

  def create
    @movement = current_user.movements.new(movement_params)
    @movement.movement_type_id = @movement_type.id
    if @movement.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to edit_movement_path(@movement, type: @movement_type)
    else
      render :new
    end
  end

  def edit
    @movement_type = MovementType.find(params[:type])
    @line_item = @movement.line_items.build
  end

  def update
    if @movement.update(movement_params)
      flash[:notice] = "Se actualizo satisfactoriamente"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def movement_params
    params.require(:movement)
    .permit(:responsable_id, :status, :movement_type_id, :originable_id, :originable_type, :destinable_id, :destinable_type, line_items_attributes: [:id, :quantity, :movement_id, :product_id])
  end

  def set_movement
    @movement = Movement.find params[:id]
  end

  def set_movement_type
    @movement_type = MovementType.find(params[:movement_type_id])
  end
end
