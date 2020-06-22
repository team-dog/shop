class Customers::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@quantity = current_customer.cart_products.new
	end

end