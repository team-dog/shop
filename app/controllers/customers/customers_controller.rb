class Customers::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
        @customer = Customer.find_by(id: current_customer.id)
    end

    def delete_account
    end

    def invalid
        change_column_default :customer, :is_value, from: true, to: false
        redirect_to root_path
    end

    def edit
        @customer = Customer.find_by(id: current_customer.id)
    end

    def update
        customer = Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to customers_path(customer.id)
    end

    private
    def customer_params
        params.require(:customer).permit(:family_name, :first_name, :family_name_ruby, :first_name_ruby, :email, :postcode, :address, :tell_number)
    end
end
