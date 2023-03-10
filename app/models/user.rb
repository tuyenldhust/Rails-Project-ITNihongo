class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :orders, dependent: :destroy
  has_many :product_likes, dependent: :destroy

  def is_like_product(product)
    product_likes.where(product_id: product.id).exists?
  end
end
