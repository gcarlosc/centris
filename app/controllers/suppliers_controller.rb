class SuppliersController < ApplicationController

  before_action :require_login

  add_breadcrumb "Proveedor", :suppliers_path

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
    add_breadcrumb "Nuevo Proveedor", new_supplier_path
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to suppliers_path
    else
      render :new
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :contact_name, :email, :phone)
  end
end
