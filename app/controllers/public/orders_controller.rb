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

  def listing
    @products = Product.where(customer_id: current_customer.id)
    @orders = Order.where(customer_id: current_customer.id).or(Order.where(order_product_id: @products.ids))
    @orders = @orders.where(order_status: "準備中")
  end

  def in_progress
    @products = Product.where(customer_id: current_customer.id)
    @orders = Order.where(customer_id: current_customer.id).or(Order.where(order_product_id: @products.ids))
    @orders = @orders.where(order_status: "準備完了")

  end
  
  def completed
    @products = Product.where(customer_id: current_customer.id)
    @orders = Order.where(customer_id: current_customer.id).or(Order.where(order_product_id: @products.ids))
    @orders = @orders.where(order_status: "取引完了")
  end

  def show
    @order = Order.find(params[:product_id])

  end

  def update
    @order = Order.find(params[:product_id])
    if @order = Order.update(order_params)
      redirect_to customer_path(current_customer)
    else
      @order = Order.find(params[:product_id])
      render "public/orders/show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :order_product_id, :order_trade_product_id, :order_status)
  end

end
