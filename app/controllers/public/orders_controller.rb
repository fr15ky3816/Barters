class Public::OrdersController < ApplicationController


  def new
    @product = Product.find(params[:product_id])
    @offer = Offer.find_by(offer_product_id: @product.id)
    @order = Order.new

  end

  def create

    @order = Order.new(order_params)
    @order.save
    redirect_to customer_path(@order.customer_id)
  end
  
  def orders_index
    @orders = Order.where(customer_id: current_customer.id)
  end
  
  def ordered_index
    @products = Product.where(customer_id: current_customer.id)
    @orders = Order.where(order_trade_product_id: @products.ids)
    
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :order_product_id, :order_trade_product_id, :order_status)
  end

end
