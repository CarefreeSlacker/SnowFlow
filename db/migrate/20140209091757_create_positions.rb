class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer  :cart_id
      t.integer  :item_id
      t.string   :item_type
      t.integer  :quantity
      t.float    :total_price
      t.boolean  :changed
      t.timestamps
    end
    add_index :positions, :cart_id
  end
end
