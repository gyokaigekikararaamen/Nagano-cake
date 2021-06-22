class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  # def total_price
  #   self.each do |cart_product|
  #     array << cart_product.product.price
  #     array.sum
  #   end
  # end

end
