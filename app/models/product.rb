class Product < ApplicationRecord
  belongs_to :customer
  attachment :image

  has_many :likes
  has_many :liked_users, through: :likes, source: :customer

  has_many :post_comments, dependent: :destroy

  has_many :offers, dependent: :destroy


  has_many :offers, class_name: "Offers", foreign_key: "offer_poduct_id", dependent: :destroy
  has_many :offer_products, through: :offers, source: :offer_product

  has_many :offered, class_name: "Offers", foreign_key: "trade_product_id", dependent: :destroy
  has_many :trade_products, through: :offered, source: :trade_product


end
