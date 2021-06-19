class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre, optional: true

 def  add_tax_price
   (self.price * 1.10).round
 end
  attachment :image
  enum product_status: { 販売中: true, 販売停止: false }
  
end
