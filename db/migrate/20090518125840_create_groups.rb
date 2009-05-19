class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name, :null => false
      t.string :caption
      t.string :group_type, :null => false
      t.integer :owner_id, :null => false
      t.integer :creator_id, :null => false
      t.boolean :active, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
