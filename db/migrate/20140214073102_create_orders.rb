class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :user_id
      t.string :country
      t.string :region
      t.string :post_code
      t.string :lane
      t.string :home
      t.string :appartament
      t.integer :floor
      t.boolean :personal_payment
      t.boolean :shipped

      t.timestamps
    end
    add_column :carts , :order_id, :integer
  end
end
