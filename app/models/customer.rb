class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_products, dependent: :destroy
  has_many :products, dependet: :destroy, through: :cart_products
  
  has_many :orders, dependet: :destroy
  has_many :addresses, dependet: :destroy
end
