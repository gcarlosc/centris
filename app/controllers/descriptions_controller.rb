class DescriptionsController < ApplicationController

  before_action :require_login

  def new
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    @description.save
  end

  private

  def description_params
    params.require(:description).permit(:brand, :sub_brand)
  end
end
