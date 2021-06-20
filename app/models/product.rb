class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre, optional: true

 def  add_tax_price
   (self.price * 1.10).round
 end
  attachment :image
  enum product_status: { 販売中: true, 販売停止: false }
  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      product_genre = Genre.find_by(id: genre_id)
      self.genres << product_genre
    end
  end
end
