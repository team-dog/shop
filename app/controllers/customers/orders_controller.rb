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
        @order = Order.new(order_create_params)
        @destination = Destination.where(customer_id: current_customer.id)
        if params[:order][:shipping_address] == "1"
            @address = current_customer.address
        elsif params[:order][:shipping_address] == "2"
            @address = c
            @order.shipping_address = Order.
        # elsif params[:order][:shipping_address] == "3"
        #     @order.[]
        end
        #  if @order.valid?
        #     render :confirm
        #  else
        #     render :new
        #  end  
        # @order = Order.find_by(customer_id: current_customer.id)
        # 商品名と単価
        # @product = Product.where(id: OrderProduct.product_id)
        # 支払い方法・配送先表示のため記載
        @destination = Destination.where(customer_id: current_customer.id)
    end

    def create
        #既に登録済みのデータと新規入力情報
        @order = Order.new(order_create_params)
        # if params[:back]
        #     render :new
        # else
        @order.save
        redirect_to orders_thanks_path
    # end
    end

    def thanks
        @order = Order.new(order_create_params)
        if params[:back]
            render :new
        else
            @order.save
            redirect_to orders_thanks_path
        end
    end

    def show
    end

    private 
    def order_create_params
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