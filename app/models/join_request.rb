class JoinRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  Status = {:pending => 'PEND', :approved => 'APPR', :rejected => 'REJC'}
end
