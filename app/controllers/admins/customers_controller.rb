class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    Customer.update(customer_params)
    redirect_to admins_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_ruby, :first_name_ruby, :postcode, :address, :tell_number, :email)
  end

end
