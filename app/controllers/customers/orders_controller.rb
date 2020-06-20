class Customers::OrdersController < ApplicationController

    def new
        # 注文詳細画面　顧客の住所・登録済みの住所・新規で登録した住所を表示のため記載
        @customer = Customer.find(params[:id])
        @destination = Destination.find(params[;id])
        @new_address = Destination.new
        # 支払い方法入力するため記載
        @order = Order.find(params[:id])
    end

    def confirm
        # 注文商品を全て表示するために記載
        @order_products = Order.products.all
        # 注文商品の個数や価格を表示のため記載
        @order_product = Order_product.find(params[:id])
        # 支払い方法・配送先表示のため記載
        @customer = Customer.find(params[:id])
        @destination = Destination.find(params[;id])
    end

    def create
        #既に登録済みのデータと新規入力情報
        @customer = Customer.find(params[:id])
        @destination = Destination.find(params[;id])
        @new_address = Destination.new
        @order = Order.find(params[:id])
        #それぞれのラジオボタンを押した際の条件分岐。現在の画面にい続けるよう記載。
        if @customer.save
        redirect_back(fallback_location: request.order_path)
        elsif @destination.save
        redirect_back(fallback_location: request.order_path)
        elsif @new_address.save
        redirect_back(fallback_location: request.order_path)
        elsif @order
        redirect_back(fallback_location: request.order_path)
        end
    end

    def thanks
    end

    private 
    def create_params
        params.require(:order).permit(:total_price, :status, :shipping_name, :shipping_postcode, :shipping_address,:payment)
    end
    
end
