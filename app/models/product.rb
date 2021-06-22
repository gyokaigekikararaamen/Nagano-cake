class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
<<<<<<< HEAD
  has_many :ordered_products, dependent: :destroy 
=======
  has_many :customers, through: :cart_products
  
  has_many :ordered_products, dependent: :destroy
>>>>>>> origin/develop
  belongs_to :genre, optional: true

 def  add_tax_price
   (self.price * 1.10).round
 end
  attachment :image
  enum product_status: { 販売中:0, 販売停止: 1 }
  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      product_genre = Genre.find_by(id: genre_id)
      self.genres << product_genre
    end
  end    
 
 validates :genre_id, presence: true
 validates :name, presence: true
 validates :image, presence: true
 validates :description, presence: true
 validates :price, presence: true
 validates :product_status, presence: true
end
