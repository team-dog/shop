class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        # 注文詳細画面　顧客の住所・登録済みの住所・新規で登録した住所を表示のため記載
        @customer = Order.find_by(customer_id: current_customer.id)
        @destination = Destination.where(customer_id: current_customer.id)
        @new_address = Destination.new
        # 支払い方法入力するため記載
        @order = Order.new
    end

    # <%= form_for(@destination, url: orders_confirm_path) do |f| %>
    #     <%= f.radio_button :address %>
    #     <%= f.select :address, @destination.all %>
    #     <%= f.label :address, "既に登録済み", {style: "display: block;"} %>
    #  <% end %>

    def confirm
        # 注文商品を全て表示するために記載
        # order_products = Order.products
        @orders = current_customer.cart_products.all
        # 商品名と単価
        # @product = Product.where(id: OrderProduct.product_id)
        # 支払い方法・配送先表示のため記載
        # @order = Order.find_by(customer_id: current_customer.id)
        @customer = Order.find_by(customer_id: current_customer.id)
        @destination = Destination.where(customer_id: current_customer.id)
        # render 'orders/confirm'
    end

    def create
        #既に登録済みのデータと新規入力情報
        # @customer = Order.find_by(customer_id: current_customer.id)
        # @destination = Destination.where(customer_id: current_customer.id)
        # @new_address = Destination.new
        @order = Order.new
        @order.save
        redirect_to orders_confirm_path
        #それぞれのラジオボタンを押した際の条件分岐。現在の画面にい続けるよう記載。
        # if @customer.save
        # redirect_back(fallback_location: request.order_path)
        # elsif @destination.save
        # redirect_back(fallback_location: request.order_path)
        # elsif @new_address.save
        # redirect_back(fallback_location: request.order_path)
        # elsif @order
        # redirect_back(fallback_location: request.order_path)
        # end
    end

    def thanks
    end

    def show
    end

    private 
    def create_params
        params.require(:order).permit(:total_price, :status, :shipping_name, :shipping_postcode, :shipping_address,:payment)
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