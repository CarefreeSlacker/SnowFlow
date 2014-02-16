class CreateHeaddresses < ActiveRecord::Migration
  def change
    create_table :headdresses do |t|
      t.string :manufacturer
      t.integer :warmnes
      t.float :price
      t.integer :category_id
      t.timestamps
    end
  end
end
