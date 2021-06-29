class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def listing
    products = Product.where(customer_id: params[:customer_id])
    orders = Order.where(customer_id: params[:customer_id]).or(Order.where(order_product_id: products.ids))
    @orders = orders.where(order_status: "準備中")
    @customer = Customer.find_by(id: params[:customer_id])
  end

  def in_progress
    @products = Product.where(customer_id: params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id]).or(Order.where(order_product_id: @products.ids))
    @orders = @orders.where(order_status: "準備完了")
    @customer = Customer.find_by(id: params[:customer_id])
  end

  def completed
    @products = Product.where(customer_id: params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id]).or(Order.where(order_product_id: @products.ids))
    @orders = @orders.where(order_status: "取引完了")
    @customer = Customer.find_by(id: params[:customer_id])
  end

  def show
    @order = Order.find(params[:product_id])
    @customer = Customer.find_by(id: params[:customer_id])
  end

  def update
    @order = Order.find(params[:product_id])
    if @order = Order.update(order_params)
      redirect_to admins_customer_path(params[:customer_id])
    else
      @order = Order.find(params[:product_id])
      render "show"
    end
  end






  private

  def order_params
    params.require(:order).permit(:customer_id, :order_product_id, :order_trade_product_id, :order_status)
  end

end
