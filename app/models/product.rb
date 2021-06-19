class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre

 def  add_tax_price
   (self.price * 1.10).round
 end
  attachment :image
end
