class Product < ApplicationRecord
  belongs_to :customer
  attachment :image
end
