class AddUniqunessTo < ActiveRecord::Migration
  def change
    remove_index :items , [:good_id, :good_type ]
    add_index :items , [:good_id, :good_type ], unique: true
  end
end
