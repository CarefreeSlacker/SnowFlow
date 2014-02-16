class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :remember_token
      t.string :role, default: :customer
      t.timestamps
    end
  end
end
