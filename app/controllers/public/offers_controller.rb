class Public::OffersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @current_customer_product = Product.where(customer_id: current_customer.id)
    @offer = Offer.new

  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save

    redirect_to product_offer_complete_path
  end

  def offers_index
    @offers = Offer.where(customer_id: current_customer.id)
  end

  def offered_index
    @products = Product.where(customer_id: current_customer.id)
    @offers = Offer.where(offer_product_id: @products.id)
  end

  def show
    @offer = Offer.find_by(offer_product_id: params[:product_id], id: params[:id])
  end



  def destroy
    @offer = Offer.find_by(offer_product_id: params[:product_id], id: params[:id])
    @offer.destroy
    redirect_to customer_path(@offer.customer_id)
  end


  private

  def offer_params
    params.require(:offer).permit(:customer_id, :offer_product_id, :trade_product_id)
  end
end
