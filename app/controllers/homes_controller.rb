class HomesController < ApplicationController
  def top
    products = Product.where(is_sold: false)
    @products = products.where(is_active: true).order(updated_at: :desc)
    # いいねした商品
    
    @likes = current_customer.likes


  end

  def about

  end
end
