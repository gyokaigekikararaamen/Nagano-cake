class ChangeDataProductStatusToProducts < ActiveRecord::Migration[5.2]
  def change
   change_column :products, :product_status, :integer
  
  end
end
