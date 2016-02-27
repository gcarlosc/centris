class SuppliersController < ApplicationController

  before_action :require_login

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to new_supplier_path
    else
      render :new
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address)
  end
end
