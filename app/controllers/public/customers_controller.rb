class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def edit
    @customer = Customer.find_by(id: current_customer.id)
  end

  def update
    @customer = Customer.find_by(id: current_customer.id)
    @customer.update(customer_params)
    if @customer.save
        flash[:notice] = "会員情報の更新が完了しました"
        redirect_to customer_path(current_customer)
    else
        @customer.attributes = customer_params
        flash[:failed] = "会員情報の更新が失敗しました。"
        render :edit
    end
  end

  def show
    @customer = Customer.find_by(id: current_customer.id)
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
          )
    end
end
