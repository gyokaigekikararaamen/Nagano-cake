class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :description
      t.integer :price
      t.boolean :product_status

      t.timestamps
    end
  end
end
