class Admins::ProductsController < ApplicationController




  def index
    products = Product.all.order(created_at: :desc)

    @products_yasai = products.where(genre_id: 1)
    @products_kudamono = products.where(genre_id: 2)
    @products_kome_zakkoku = products.where(genre_id: 3)
    @products_kakousyokuhin = products.where(genre_id: 4)
    @products_inryou = products.where(genre_id: 5)
    @products_sonota = products.where(genre_id: 6)
  end

  def show
    @product = Product.find(params[:id])
    @post_comments = PostComment.where(product_id: @product.id)
    @post_comment = PostComment.new
  end

  def edit
    @product = Product.find(params[:id])
    @customer = @product.customer
  end




end
