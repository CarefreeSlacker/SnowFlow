class CreatCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.float   :total_price
      t.integer :total_positions
      t.integer :total_items
      t.timestamps
    end
  end
end
