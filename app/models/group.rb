class Group < ActiveRecord::Base
  has_many :members, :through => :memberships, :source => :user
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id

  has_many :messages, :order => 'created_at DESC'
  has_many :memberships
  has_many :introductions
  has_many :invitations
  has_many :join_requests

  validates_presence_of :name, :group_type

  Type = {:invite_only => "INV", :moderated => "MOD"}

  def is_moderated?
    group_type == Type[:moderated] ? true : false
  end

  def is_invite_only?
    group_type == Type[:invite_only] ? true : false
  end
end
