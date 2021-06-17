class CreateOrderedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_products do |t|
      t.integer :product_id,        null: false
      t.integer :order_id,          null: false
      t.integer :price,             null: false
      t.integer :amount,            null: false
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
