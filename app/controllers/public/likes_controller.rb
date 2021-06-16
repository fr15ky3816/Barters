class Public::LikesController < ApplicationController

  def create
    @like = Like.new(product_id: params[:product_id], customer_id: current_customer.id)
    @like.save
    redirect_to product_path(params[:product_id])

  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], customer_id: current_customer.id)
    @like.destroy
    redirect_to product_path(params[:product_id])
  end

  

end
