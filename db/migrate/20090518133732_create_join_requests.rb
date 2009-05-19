class CreateJoinRequests < ActiveRecord::Migration
  def self.up
    create_table :join_requests do |t|
      t.integer :user_id, :null => false
      t.integer :group_id, :null => false
      t.string :status, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :join_requests
  end
end
