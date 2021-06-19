class AddIndexToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :is_deleted, :boolean, :default => TRUE
  end
  
end
