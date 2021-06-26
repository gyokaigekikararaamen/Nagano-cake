class Order < ApplicationRecord
  has_many :ordered_products, dependent: :destroy
  belongs_to :customer

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 未注文: 0, 入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5 }
  def total_amount
    array = []
    self.ordered_products.each do |ordered_product|
      array << ordered_product.amount
    end
    array.sum
  end
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
