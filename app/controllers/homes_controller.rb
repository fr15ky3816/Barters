class HomesController < ApplicationController
  def top
    products = Product.where(is_sold: false, is_active: true)
    products = products.order(updated_at: :desc)
    customer = Customer.where(customer_attribute: "生産者")
    products = products.where(customer_id: customer.ids)
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

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: "guest@example.com") do |customer|

      customer.password = SecureRandom.urlsafe_base64
    end
    sign_in customer
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end




end

