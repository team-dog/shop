class Admin::OrdersController < ApplicationController
  def index
    @order_products = Product.all
  end
  def show
  end
  def update
  end
end
