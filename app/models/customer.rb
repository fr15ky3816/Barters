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



  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
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
