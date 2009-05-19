class User < ActiveRecord::Base

  concerned_with :authentication, :group
  has_many :groups, :through => :memberships
  has_many :owned_groups, :class_name => 'Group', :foreign_key => :owner_id

  has_many :messages
  has_many :sent_introductions, :class_name => 'Introduction', :order => 'created_at DESC', :foreign_key => :sender_id
  has_many :received_introductions, :class_name => 'Introduction', :order => 'created_at DESC', :foreign_key => :receiver_id

  has_many :memberships
  has_many :join_requests

  validates_presence_of :username, :name, :email
  validates_uniqueness_of :username, :email

  Status = {:active => 'ACT', :inactive => 'INA', :deleted => 'DEL'}
end
