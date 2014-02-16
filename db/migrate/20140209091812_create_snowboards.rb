class CreateSnowboards < ActiveRecord::Migration
  def change
    create_table :snowboards do |t|
      t.string  :manufacturer
      t.string  :name
      t.integer :length
      t.string  :righty
      t.integer :deflection
      t.string  :form
      t.text    :description
      t.timestamps
    end
  end
end
