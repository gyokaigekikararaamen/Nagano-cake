class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

 def finish
   self.ordered_produ
 end

  #制作ステータスのenumを定義
  enum production_status: { 制作不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }
end
