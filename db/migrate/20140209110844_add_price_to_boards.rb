class AddPriceToBoards < ActiveRecord::Migration
  def change
    add_column :snowboards , :price , :float
  end
end
