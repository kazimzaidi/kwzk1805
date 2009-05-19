class CreateIntroductions < ActiveRecord::Migration
  def self.up
    create_table :introductions do |t|
      t.string :email, :null => false
      t.integer :sender_id, :null => false
      t.integer :group_id, :null => false
      t.integer :receiver_id
      t.string :status, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :introductions
  end
end
