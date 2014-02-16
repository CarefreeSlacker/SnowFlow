class AddMetherialToHeaddresses < ActiveRecord::Migration
  def change
    add_column :headdresses , :matherial, :string
  end
end
