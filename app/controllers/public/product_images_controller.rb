class Public::ProductImagesController < ApplicationController
  before_action :authenticate_customer!

  def destroy
    product = Product.find(params[:product_id])
    product_image = ProductImage.find(params[:product_image_id])
    product_image.destroy

    redirect_to edit_product_path(product.id)
  end
end
