class Public::LikesController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @like = Like.new(product_id: params[:product_id], customer_id: current_customer.id)
    @like.save

  end

  def destroy
    @product = Product.find_by(id: params[:product_id])
    @like = Like.find_by(product_id: params[:product_id], customer_id: current_customer.id)
    @like.destroy
  end



end
