class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :invitee, :class_name => 'User', :foreign_key => :receiver_id

  Status => {:pending => 'PEND', :accepted => 'ACCP'}
end
