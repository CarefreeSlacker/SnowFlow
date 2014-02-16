class AddCollectionToHeaddresses < ActiveRecord::Migration
  def change
    add_column :headdresses, :collection, :string
    add_column :headdresses, :name, :string
  end
end
