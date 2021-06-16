class Product < ApplicationRecord
  belongs_to :customer
  attachment :image

  has_many :likes
  has_many :liked_users, through: :likes, source: :customer

end
