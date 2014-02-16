class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer   :good_id
      t.string    :good_type
      t.timestamps
    end
    add_index :items , [ :good_id , :good_type ]
    remove_column :positions, :item_type , :string

  end
end
