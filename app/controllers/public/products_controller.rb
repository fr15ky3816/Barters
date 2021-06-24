class Public::ProductsController < ApplicationController

  def new
    if customer_signed_in?
      @product = Product.new
      @product.product_images.build
    else
      redirect_to new_customer_registration_path
    end
  end

  def create
    @product = Product.new(product_params)
    @product.customer_id = current_customer.id
    if @product.save
      redirect_to product_complete_path
    else
      render "public/products/new"
    end
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
    redirect_to customer_product_index_path(@product.customer.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product.id)
  end



  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :is_active, :customer_id, product_images_images: [])
  end
end
