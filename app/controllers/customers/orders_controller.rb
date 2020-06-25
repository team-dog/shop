class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        # 注文詳細画面　顧客の住所・登録済みの住所・新規で登録した住所を表示のため記載
        @customer = Order.find_by(customer_id: current_customer.id)
        @destination = Destination.find_by(customer_id: current_customer.id)
        # 支払い方法入力するため記載
        @order = Order.new
    end

    def confirm
        # 注文商品を全て表示するために記載
        @orders = current_customer.cart_products.all
        @order = Order.new(order_params)
        if params[:select_radio] == "1"
            @order.shipping_postcode = current_customer.postcode
            @order.shipping_address = current_customer.address
            @order.shipping_name = current_customer.family_name + current_customer.family_name
            @order.payment = params[:order][:payment]
        elsif params[:select_radio] == "2"
            @destination = Destination.find(params[:order][:select_destinations])
            @order.shipping_postcode = @destination.postcode
            @order.shipping_address = @destination.address
            @order.shipping_name = @destination.name
            @order.payment = params[:order][:payment]
        elsif params[:select_radio] == "3"
            @order.shipping_postcode = params[:order][:shipping_postcode]
            @order.shipping_address = params[:order][:shipping_address]
            @order.shipping_name = params[:order][:shipping_name]
            @order.payment = params[:order][:payment]
        end
    end

    def create
        #既に登録済みのデータと新規入力情報
        @order = current_customer.orders.new(order_params)
        cart_products = current_customer.cart_products.all
        if @order.save
            cart_products.each do |cart_product|
                order_product = OrderProduct.new(order_products_params)
                order_product.product_id = cart_product.product_id
                order_product.order_id = @order.id
                order_product.quantity = cart_product.quantity
                product = Product.find(cart_product.product_id)
                order_product.price = product.price
                order_product.save
            end
        # if params[:back]
        #     render :new
        # else
            cart_products.destroy_all
            redirect_to orders_thanks_path
        end
    # end
    end

    def thanks
    end

    private
    def order_params
    params.require(:order).permit(:total_price, :status, :shipping_name, :shipping_postcode, :shipping_address, :payment)
    end

    def order_products_params
        params.require(:order).permit(:quantity, :price)
    end

end


# <div class="order_confirm">
# # newで入力した支払い方法とお届け先を表示
#         <span>支払方法</span><%= @customer.payment %>
#         <span>お届け先</span>
# # 既に登録済みの住所か新しく登録した住所かお届け先を表示
#         <% if @destination.address.exists? %>
#             <%= @destination.address %>
#         <%  elsif @customer.address.exists? %>
#             <%= @customer.address %>
#         <% end %>
# </div>