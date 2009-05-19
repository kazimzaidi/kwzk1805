class Introduction < ActiveRecord::Base
  belongs_to :group
  belongs_to :introducer, :class_name => 'User', :foreign_key => :sender_id
  belongs_to :receiver, :class_name => 'User', :foreign_key => :receiver_id

  validates_presence_of :email

  Status = {:pending => 'PEND', :approved => 'APPR', :rejected => 'REJC'}
end
