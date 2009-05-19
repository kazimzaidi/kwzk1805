class Group < ActiveRecord::Base
  has_many :members, :through => :memberships, :source => :users
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id

  has_many :messages
  has_many :introductions
  has_many :invitations
  has_many :join_requests

  validates_presence_of :name, :group_type

  Type = {:invite_only => "INV", :moderated => "MOD"}
end
