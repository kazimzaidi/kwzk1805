class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :group_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
