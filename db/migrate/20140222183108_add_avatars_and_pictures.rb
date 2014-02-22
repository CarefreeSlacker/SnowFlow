class AddAvatarsAndPictures < ActiveRecord::Migration
  def change
    add_column :users , :avatar, :string
    add_column :snowboards , :picture, :string
    add_column :headdresses , :picture, :string
  end
end
