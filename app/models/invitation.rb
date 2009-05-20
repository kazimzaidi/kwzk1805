class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :invitee, :class_name => 'User', :foreign_key => :receiver_id

  validates_presence_of :email

  Status = {:pending => 'PEND', :accepted => 'ACCP'}
end
