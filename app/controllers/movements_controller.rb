class MovementsController < ApplicationController

  before_action :require_login

  before_action :set_movement, only: [:edit, :show, :update, :destroy]
  before_action :set_movement_type, only: [:new, :create]

  add_breadcrumb "Movimiento Almacen"

  def index
    @movements = Movement.all.order('id ASC')
    respond_to do |format|
      format.html
      format.csv { send_data @movements.to_csv }
      format.xls #{ send_data @movements.to_csv(col_sep: "\t") }
    end
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
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MovementPdf.new(@movement)
        send_data pdf.render, filename: "guia_de_movimiento_#{@movement.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def edit
    @movement_type = MovementType.find(params[:type])
    @sku = @movement.skus.build
    @item = @movement.items.build
    @skus = Sku.where(warehouse_id: @movement.originable_id).all.by_statuses(@movement_type.id == 4 ? 1 : 0)
    add_breadcrumb "Editar Movimiento #{@movement.id}"
  end

  def update
    return redirect_to root_path unless @movement.pending?
    if @movement.update(movement_params)
      @movement.saved!
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to movements_path
    else
      render :edit, locals: { movement_type: @movement_type = @movement.movement_type }
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
