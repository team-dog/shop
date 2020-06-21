class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	def subtotal
		product.price * quantity
	end
end
