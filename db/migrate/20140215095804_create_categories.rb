class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    add_column :snowboards, :category_id, :integer
    add_index :snowboards, :category_id
    add_column :items , :category_id, :integer
    add_index :items , :category_id
  end
end
