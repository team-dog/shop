class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_products
	has_many :cart_products
end
