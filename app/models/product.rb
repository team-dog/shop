class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_products
	has_many :cart_products

	attachment :image

	def tax_price
		price * 1.1
	end



end
