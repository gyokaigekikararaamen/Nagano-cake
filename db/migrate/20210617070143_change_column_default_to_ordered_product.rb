class ChangeColumnDefaultToOrderedProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :payment_method, :integer, :default => 0
    change_column :orders, :order_status, :integer, :default => 0
  end
end
