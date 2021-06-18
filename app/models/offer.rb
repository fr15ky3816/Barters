class Offer < ApplicationRecord
  belongs_to :customer

  belongs_to :offer_product, class_name: "Product"
  belongs_to :trade_product, class_name: "Product"



end
