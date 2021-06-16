class Public::PostCommentsController < ApplicationController


  def create
    product = Product.find(params[:product_id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.customer_id = current_customer.id
    post_comment.product_id = product.id
    post_comment.save
    redirect_to request.referer
  end

  def destroy
    post_comment = PostComment.find_by(id: params[:id], product_id: params[:product_id])
    post_comment.destroy
    redirect_to request.referer
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
