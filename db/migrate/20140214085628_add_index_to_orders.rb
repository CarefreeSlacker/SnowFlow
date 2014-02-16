class AddIndexToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.change :cart_id, :integer, unique: true
    end
    add_column :orders, :done, :boolean
    add_column :carts, :checkouted, :boolean
  end
end
