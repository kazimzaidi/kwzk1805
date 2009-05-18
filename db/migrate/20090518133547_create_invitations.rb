class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :email
      t.integer :group_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
