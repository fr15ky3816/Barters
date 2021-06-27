class HomesController < ApplicationController
  def top
    products = Product.where(is_sold: false, is_active: true)
    @products = products.order(updated_at: :desc)
    # いいねした商品
    if customer_signed_in?
      @likes = current_customer.likes
    end
    @products_yasai = products.where(genre_id: 1)
    @products_kudamono = products.where(genre_id: 2)
    @products_kome_zakkoku = products.where(genre_id: 3)
    @products_kakousyokuhin = products.where(genre_id: 4)
    @products_inryou = products.where(genre_id: 5)
    @products_sonota = products.where(genre_id: 6)


  end

  def about

  end
end

