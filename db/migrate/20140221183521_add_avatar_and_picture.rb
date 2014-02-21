class AddAvatarAndPicture < ActiveRecord::Migration
  def up
    add_column :users , :avatar, :string
    add_column :snowboards , :picture, :string
    add_column :headdresses, :picture, :string
  end

  def down
    remove_column :users , :avatar
    remove_column :snowboards , :picture
    remove_column :headdresses, :picture
  end
end
