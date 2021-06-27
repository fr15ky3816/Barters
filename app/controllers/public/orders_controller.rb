class Public::OrdersController < ApplicationController


  def new
    @product = Product.find(params[:product_id])
    @offer = Offer.find_by(offer_product_id: @product.id)
    @order = Order.new

  end

  def create

    @order = Order.new(order_params)
    @offer = Offer.find_by(offer_product_id: @order.order_product_id)
    if @order.save
      @offer.destroy
      redirect_to  product_order_complete_path
    else
      @order = Order.new(order_params)
      @offer = Offer.find_by(offer_product_id: @order.order_product_id)
      render "public/orders/new"
    end
  end

  def complete
  end

  def orders_index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def ordered_index
    @products = Product.where(customer_id: current_customer.id)
    @ordereds = Order.where(order_product_id: @products.ids)

  end

  def show
    @order = Order.find(params[:product_id])

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :order_product_id, :order_trade_product_id, :order_status)
  end

end
