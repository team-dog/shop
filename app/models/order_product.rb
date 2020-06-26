class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    def subtotal_price
    	price * quantity
    end

    def tax_price
    	price * 1.1
    end
end
