class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  def after_sign_in_path_for(resource)
    if customer_signed_in?
      root_path
    else
      admins_products_path
    end
  end





  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [
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
      ])
  end
end
