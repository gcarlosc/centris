class GuidesController < ApplicationController
  def index
    @guides = Guide.all
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      redirect_to new_guide_path
    else
      render :new
    end
  end

  def new_interno
    @guide = Guide.new
  end

  def new_traspaso
    @guide = Guide.new
  end

  private

  def guide_params
    params.require(:guide)
    .permit(:creator_id, :responsable_id, :status, :movement_type_id, :originable_id, :originable_type, :destinable_id, :destinable_type)
  end
end
