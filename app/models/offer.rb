class Offer < ApplicationRecord
  belongs_to :customer

  belongs_to :offer_product, class_name: "Product"
  belongs_to :trade_product, class_name: "Product"

  validates :offer_product_id, presence: true
  validates :customer_id, presence: true
  validates :trade_product_id, presence: true

end
