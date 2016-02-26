class MovementsController < ApplicationController

  before_action :set_movement, only: [:edit, :update]
  before_action :set_movement_type, only: [:new, :edit, :update, :create]

  def index
    @movements = Movement.all
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.movement_type_id = @movement_type.id
    if @movement.save
      redirect_to edit_movement_type_movement_path(@movement_type, @movement)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movement.update(movement_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def movement_params
    params.require(:movement)
    .permit(:creator_id, :responsable_id, :status, :movement_type_id, :originable_id, :originable_type, :destinable_id, :destinable_type)
  end

  def set_movement
    @movement = Movement.find params[:id]
  end

  def set_movement_type
    @movement_type = MovementType.find(params[:movement_type_id])
  end
end
