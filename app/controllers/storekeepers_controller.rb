class StorekeepersController < ApplicationController

  before_action :require_login

  def index
    @storekeepers = Storekeeper.all
  end

  def new
    @storekeeper = Storekeeper.new
  end

  def create
    @storekeeper = Storekeeper.new(storekeeper_params)
    if @storekeeper.save
      redirect_to new_storekeeper_path
    else
      render :new
    end
  end

  private

  def storekeeper_params
    params.require(:storekeeper).permit(:first_name, :last_name, :email, :phone)
  end
end
