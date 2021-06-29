class Admins::OffersController < ApplicationController
  before_action :authenticate_admin!


  def offers_index
    @offers = Offer.where(customer_id: params[:customer_id])
  end

  def offered_index
    @products = Product.where(customer_id: params[:customer_id])
    @offers = Offer.where(offer_product_id: @products.ids)
  end

  def show
    @offer = Offer.find_by(offer_product_id: params[:product_id], id: params[:id])
    product = Product.find_by(id: params[:product_id])
    @customer = Customer.find_by(id: product.customer_id)
  end

  def destroy
    @offer = Offer.find_by(offer_product_id: params[:product_id], id: params[:id])
    if @offer.destroy
      redirect_to admins_customer_path(@offer.customer_id)
    else
      redirect_to admins_product_offer_path(offer.offer_product.id, offer.id)
    end

  end

end
