class GuidesController < ApplicationController
  def index
    @guides = Guide.all
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
  end

  private

  def guide_params
    params.require(:guide)
    .permit(:creator_id, :responsable_id, :status, :movement_type_id, :origin_id, :origin_type, :destiny_id, :destiny_type)
  end

  def new_interno
  end

  def new_traspaso
  end
end
