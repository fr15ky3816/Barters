class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show, :index_1, :index_2, :index_3, :index_4, :index_5, :index_6, :index_7, :index_8, :search]

  def new
    if customer_signed_in?
      @product = Product.new
      @product.product_images.build
      if current_customer.customer_attribute = "生産者"
        @genres = Genre.where(id: 1..6)
      elsif current_customer.customer_attribute = "飲食店"
        @genres = Genre.find(7)
      else
        @genres = Genre.find(8)
      end
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
      @genres = Genre.all
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

  def index_1
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 1)
  end

  def index_2
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 2)
  end

  def index_3
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 3)
  end

  def index_4
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 4)
  end

  def index_5
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 5)
  end

  def index_6
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 6)
  end

  def index_7
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 7)
  end

  def index_8
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    @products = products.where(genre_id: 8)
  end

  def search
    products = Product.search(params[:keyword])
    @products = products.where(is_sold: false, is_active: true)
    @keyword = params[:keyword]
  end











  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :is_active, :customer_id, product_images_images: [])
  end
end
