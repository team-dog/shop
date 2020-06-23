class Admins::OrdersController < ApplicationController
  def index
    @order_products = OrderProduct.all
  end

  def show
    @customer = Order.find(params[:customer_id])
    @order = Order.find(params[:id])
    @new_order = Order.new
    @order_product = OrderProduct.new
    @orders = Order.all
  end

  # 制作ステータス
  def update
    status = Order.find(params[:order_id])
    status.update(update_params)
    redirect_to admins_order_path
  end

  private 
    def update_params
        params.require(:order).permit(:status)
    end
end
