class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :encrypted_password, :null => false
      t.string :email, :null => false
      t.string :name, :null => false
      t.datetime :dob
      t.string :gender
      t.string :status, :null => false

      t.string :persistence_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
