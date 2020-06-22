class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	def subtotal_price
		product.price * quantity
	end
end
