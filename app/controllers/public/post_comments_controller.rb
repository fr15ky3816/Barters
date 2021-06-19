class Public::PostCommentsController < ApplicationController


  def create
    product = Product.find_by(id: params[:product_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.product_id = product.id
    comment.save
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
