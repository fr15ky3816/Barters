class Public::ProductsController < ApplicationController

  def new
    if customer_signed_in?
      @product = Product.new
    else
      redirect_to new_customer_registration_path
    end
  end

  def create
    @product = Product.new(product_params)
    @product.customer_id = current_customer.id
    @product.save
    redirect_to product_complete_path
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @products = Product.where(customer_id: @customer.id)
  end

  def show
    @product = Product.find(params[:id])
    @post_comments = PostComment.where(product_id: @product.id)
    @post_comment = PostComment.new
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    byebug
    redirect_to customer_product_index_path(@product.customer.id)
  end

  def edit
    @product = Product.find(params[:id])
  end



  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :is_active, :image1_id, :image2_id, :image3_id, :customer_id)
  end
end
