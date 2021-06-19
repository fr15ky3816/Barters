class Order < ApplicationRecord
  belongs_to :customer
  
  belongs_to :order_product, class_name: "Product"
  belongs_to :order_trade_product, class_name: "Product"

  enum order_status: {"準備中": 0, "準備完了": 1, "取引完了": 2}
end
