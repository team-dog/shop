class Admins::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  # 注文ステータスの更新
  def update
    status = OrderProduct.find(params[:order_id])
    status.update(update_params)
    redirect_to admins_order_path
  end

  private
    def update_params
        params.require(:order_product).permit(:status)
    end
end
