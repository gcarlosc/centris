class AccountsController < ApplicationController
  before_action :authenticate_account

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  private

    def account_params
      params.require(:account).permit(:organization_name, :web, :subdomain)
    end
end
