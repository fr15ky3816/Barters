class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show]

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
    @customer = Customer.find_by(id: params[:id])
  end

  def show_profile
    @customer = Customer.find_by(id: current_customer.id)
  end

  def likes_index
    @customer = current_customer
  end

  def profile_new
    @customer = current_customer
  end

  def profile_create
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_complete_path
    else
      @customer = Customer.find(params[:id])
      render "profile_new"
    end
  end

  def complete
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
