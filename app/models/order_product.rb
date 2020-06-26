class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product


    require 'bigdecimal'
    def tax_price
    	(BigDecimal("#{price}") * BigDecimal("1.1")).ceil
    end

    def subtotal_price
    	self.tax_price.floor * quantity
    end
end
