class Admins::CustomersController < ApplicationController

  def index
    customers = Customer.all.order(created_at: :desc)
    @customers_on = customers.where(is_deleted: false)
    @customers_off = customers.where(is_deleted: true)

  end

  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_params)
    if @customer.save
      flash[:notice] = "会員情報の更新が完了しました"
      redirect_to admins_products_path
    else
      @customer.attributes = customer_params
      flash[:failed] = "会員情報の更新が失敗しました。"
      render :edit
    end
  end










  private

  def customer_params
    params.require(:customer).permit(
      :customer_first_name,
      :customer_last_name,
      :customer_first_name_kane,
      :customer_last_name_kane,
      :postcode,
      :adress,
      :phone_numer,
      :is_deleted,
      :shop_name,
      :shop_description,
      :customer_attribute,
      :customer_image
    )
  end

end
