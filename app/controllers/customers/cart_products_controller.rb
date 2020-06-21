class Customers::CartProductsController < ApplicationController
	def index
		@cart_products = CartProduct.where(customer_id: current_customer.id)
	end

	def create
		@product = Products.find(params[:id])
		cart_product = current_customer.cart_products.new(product_id: @products.id)
		cart_product.save
		redirect_to cart_products_path
	end

	def update
		@cart_product = current_customer.cart_products.find(params[:id])
		@cart_product.update(cart_product_params)
	end

	def destroy
		@cart_product = CartProduct.find(params[:id])
		@cart_product.destroy
		render :index
	end

	def empty
		@cart_products = CartProducts.where(customer_id: current_customer)
		@cart_products.destroy
		redirect_to products_path
		# render :index
	end

	private

		def cart_product_params
			params.require(:cart_products).permit(:quantity)
		end
end
