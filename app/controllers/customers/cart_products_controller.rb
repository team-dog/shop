class Customers::CartProductsController < ApplicationController
	def indexexit
		@cart_products = CartProduct.where(customer_id: current_customer.id)
	end

	def create
		cart_product = current_customer.cart_products.new(cart_product_params)
		cart_product.product_id = params[:product_id]
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
			params.require(:cart_product).permit(:quantity)
		end
end
