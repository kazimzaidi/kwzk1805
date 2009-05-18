class User < ActiveRecord::Base
  has_many :groups, :through => :memberships
  has_many :owned_groups, :class_name => 'Group', :foreign_key => :owner_id

  has_many :messages
  has_many :sent_introductions, :class_name => 'Introduction', :order => 'created_at DESC', :foreign_key => :sender_id
  has_many :received_introductions, :class_name => 'Introduction', :order => 'created_at DESC', :foreign_key => :receiver_id

  has_many :memberships
  has_many :join_requests

  Status = {:active => 'ACT', :inactive => 'INA', :deleted => 'DEL'}
end
