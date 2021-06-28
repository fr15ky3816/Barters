class Product < ApplicationRecord
  belongs_to :customer

  has_many :likes
  has_many :liked_users, through: :likes, source: :customer

  has_many :post_comments, dependent: :destroy

  has_many :product_images, dependent: :destroy
  accepts_attachments_for :product_images, attachment: :image

  belongs_to :genre

  # offer
  has_many :offers, class_name: "Offers", foreign_key: "offer_product_id"
  has_many :offer_products, through: :offers, source: :offer_product

  has_many :offereds, class_name: "Offers", foreign_key: "trade_product_id"
  has_many :trade_products, through: :offereds, source: :trade_product

  # order
  has_many :orders, class_name: "Orders", foreign_key: "order_product_id"
  has_many :order_products, through: :orders, source: :order_product

  has_many :ordereds, class_name: "Orders", foreign_key: "order_trade_product_id"
  has_many :order_trade_products, through: :ordereds, source: :order_trade_product

  validates :name, length: { maximum: 40 }
  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
  validates :description, presence: true

end
