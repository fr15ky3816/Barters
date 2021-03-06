class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :product

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_many :post_comments, dependent: :destroy

  has_many :offers, dependent: :destroy

  has_many :orders, dependent: :destroy

  enum customer_attribute: { "生産者": 0, "飲食店": 1, "その他ユーザー": 2 }

  attachment :customer_image


  def already_liked?(product)
    likes.exists?(product_id: product.id)
  end

  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end
end
