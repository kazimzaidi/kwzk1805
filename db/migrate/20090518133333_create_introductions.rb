class CreateIntroductions < ActiveRecord::Migration
  def self.up
    create_table :introductions do |t|
      t.string :email
      t.integer :sender_id
      t.integer :group_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :introductions
  end
end
