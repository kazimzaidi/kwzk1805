class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :caption
      t.string :type
      t.integer :owner_id
      t.integer :creator_id
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
