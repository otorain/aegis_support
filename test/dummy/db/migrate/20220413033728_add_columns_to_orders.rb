class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_no_with_prefix, :string
    add_column :orders, :order_no_with_suffix, :string
    add_column :orders, :order_no_with_specific_length, :string
  end
end
