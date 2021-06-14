class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:customer_first_name,
       :customer_last_name,
       :customer_first_name_kane,
       :customer_last_name_kane,
       :postcode,
       :adress,
       :phone_numer,
       :is_deleted,

       :shop_name,
       :shop_description,
       :customer_attribute])
  end



end
