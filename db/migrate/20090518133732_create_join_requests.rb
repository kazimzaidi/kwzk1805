class CreateJoinRequests < ActiveRecord::Migration
  def self.up
    create_table :join_requests do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :join_requests
  end
end
