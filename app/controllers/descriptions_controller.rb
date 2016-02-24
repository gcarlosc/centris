class DescriptionsController < ApplicationController
  def new
  	@description = Description.new
  end

  def create
    @description = Description.new(description_params)
    if @description.save
      redirect_to new_description_path
    else
      render :new
    end
  end

  private

  def description_params
    params.require(:description).permit(:brand, :sub_brand)
  end
end
