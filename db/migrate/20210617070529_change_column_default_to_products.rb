class ChangeColumnDefaultToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :product_status, :boolean, :default => TRUE
  end
end
