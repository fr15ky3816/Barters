class Public::LikesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @product = Product.find_by(id: params[:product_id])
    @like = Like.new(product_id: params[:product_id], customer_id: current_customer.id)
    @like.save
    @post_comments = PostComment.where(product_id: @product.id)
  end

  def destroy
    @product = Product.find_by(id: params[:product_id])
    @like = Like.find_by(product_id: params[:product_id], customer_id: current_customer.id)
    @like.destroy
    @post_comments = PostComment.where(product_id: @product.id)
  end
end
