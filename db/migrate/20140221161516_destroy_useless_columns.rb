class DestroyUselessColumns < ActiveRecord::Migration
  def change
    remove_column :positions, :changed
    remove_column :snowboards, :righty

  end
end
