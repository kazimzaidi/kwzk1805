class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password
      t.string :email
      t.string :name
      t.datetime :dob
      t.string :gender
      t.string :status

      t.string :persistence_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
