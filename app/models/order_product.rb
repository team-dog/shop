class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    def tax_price
    	price * 1.1
    end

    def subtotal_price
    	self.tax_price.floor * quantity
    end
end
