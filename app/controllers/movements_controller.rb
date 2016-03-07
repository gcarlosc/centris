class MovementsController < ApplicationController

  before_action :require_login

  before_action :set_movement, only: [:edit, :show, :update, :destroy]
  before_action :set_movement_type, only: [:new, :create]

  add_breadcrumb "Movimiento Almacen"

  def index
    @movements = Movement.all.order(created_at: :asc)
    add_breadcrumb "Historial de Movimientos"
  end

  def new
    @movement = current_user.movements.new
    add_breadcrumb "Nuevo Movimiento"
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

  def show
  end

  def edit
    @movement_type = MovementType.find(params[:type])
    @sku = @movement.skus.build
    @skus = Sku.where(warehouse_id: @movement.originable_id).all.by_statuses([:active ])
    add_breadcrumb "Editar Movimiento #{@movement.id}"
  end

  def update
    return redirect_to root_path unless @movement.pending?
    @movement.saved!
    if @movement.update(movement_params)
      flash[:notice] = "Se actualizo satisfactoriamente"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @movement.destroy
    redirect_to movements_path, notice:"El movimiento fue exitosamente eliminado"
  end

  private

  def movement_params
    params.require(:movement)
    .permit(:responsable_id, :status, :movement_type_id, :originable_id, :originable_type, :destinable_id, :destinable_type, skus_attributes: [:id, :sku, :status, :product_id, :warehouse_id, :movement_id, :_destroy])
  end

  def set_movement
    @movement = Movement.find params[:id]
  end

  def set_movement_type
    @movement_type = MovementType.find(params[:movement_type_id])
  end
end
