class AddShippingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_option, :string
    add_column :orders, :shipping_price, :integer
  end
end
