class Customers::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@cart_product_quantity = current_customer.cartproducts.new
	end

end